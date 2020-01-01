require 'net/http'
require 'jwt'

class Api::V1::WechatsController < Api::V1::BaseController
  include Wechat
  before_action :set_customer, only: [:wechat_pay]

  def wechat_auth
    session_key, open_id = auth_code2Session(params[:code])
    phone_number = decryptData(session_key, open_id, params[:encryptedData], params[:iv])
    # 根据用户的open_id和phone_number查找或创建用户
    customer = Customer.find_or_create_by(phone_number: phone_number, wx_open_id: open_id)
    @token = JWT.encode phone_number, nil, 'none'
    @mixed_phone_number = phone_number[0..2] + '****' + phone_number[7..-1]
    @phone_number = phone_number
    @message = '登录成功！'
    @code = 0
  rescue => ex
    @token = nil
    @mixed_phone_number = nil
    @code = 1

    @message = '登录失败！'
  end

  # 微信支付接口
  def wechat_pay
    open_id = @customer.wx_open_id
    spbill_create_ip = request.ip
    province, city, district = params[:area].split(',') if params[:area].present?
    out_trade_no = Time.now.strftime('%Y%m%d%H%M%S')
    delivery_time = Time.now + 24.hours
    productIds = params[:productIds].split(',')
    id_count_hash = count_duplicate_elements productIds
    products = Product.where(id: productIds.uniq)
    total_fee = 0
    products.each do |product|
      total_fee += product.price * id_count_hash[product.id.to_s]
    end

    # 当前订单的金额减去优惠券的金额
    total_fee = total_fee - params[:coupon_value].to_i  if params[:coupon_id]

    # 在返回数据前先创建订单
    # 并在订单中加入商品的信息
    if params[:recipient_name] && params[:recipient_phone_number] && params[:location_address] && total_fee && open_id && params[:area] && params[:productIds]
      order = @customer.orders.create(recipient_name: params[:recipient_name],
                                      recipient_phone_number: params[:recipient_phone_number],
                                      location_address: params[:location_address],
                                      delivery_start_time: delivery_time,
                                      delivery_end_time: delivery_time,
                                      zhekou: 1,
                                      city_id: 5,
                                      purchase_source: 'cacaoh珂珂琥微信小程序',
                                      is_mobile: true,
                                      products_due: total_fee,
                                      wx_open_id: open_id,
                                      address_province: province.gsub(/市|省/, ''),
                                      address_city: city,
                                      address_district: district,
                                      delivery_type: 'third_party_delivery',
                                      spbill_create_ip: spbill_create_ip,
                                      out_trade_no: out_trade_no)


      # 为订单循环创建PurchaseItem
      products.each { |product| PurchaseItem.create(product_id: product.id, order_id: order.id, quantity: id_count_hash[product.id.to_s]) } unless products.empty?

      # 如果有优惠券的付款记录则创建一条优惠券的付款记录
      if params[:coupon_id]
        order.order_payment_records.create(payment_method_id: params[:coupon_id],
                                           payment_method_type: params[:coupon_type],
                                           cost: params[:coupon_value],
                                           timestamp: Time.now)
      end

      @pay_params, @code, @message = pay_params_data(body_str(params[:productIds].split(',')), total_fee, spbill_create_ip, open_id, out_trade_no)
      @order_id = order.id

      # 支付成功后执行同步订单的任务
      ::SyncOrderJob.perform_later order.id
    else
      @pay_params, @code, @message = {}, 1, '缺失重要参数！'
    end
  end

  # 微信支付回调接口
  def wechat_pay_notify
    result = Hash.from_xml(request.body.read)["xml"]
    Rails.logger.info result

    # 找到对应的订单改变订单的状态
    order = Order.find_by(out_trade_no: result['out_trade_no'])
    order.turn_paid! if order.present? && order.unpaid?
  end

  # 更新订单的状态
  def update_order_payment_status
    # 启动更新订单状态的任务
    UpdateOrderPaymentStatusJob.perform_later params[:order_id]
  end

  # 已存在的订单再次发起支付请求
  # 接受一个产品id的数组
  def pay_again
    order = Order.find_by_id params[:order_id]
    productIds = order.products.pluck(:id).uniq
    if  order.nil?
      @pay_params, @code, @message = {}, 1, '没有查询到该订单！'
    else
      out_trade_no = Time.now.strftime('%Y%m%d%H%M%S')
      order.out_trade_no = out_trade_no
      order.save
      total_fee, spbill_create_ip, openid, out_trade_no = order.products_due, order.spbill_create_ip, order.customer.wx_open_id, out_trade_no
      @pay_params, @code, @message = pay_params_data(body_str(productIds), total_fee, spbill_create_ip, openid, out_trade_no)
    end
  end

  private
    def body_str productIds
      id_count_hash = count_duplicate_elements productIds
      products = Product.where(id: productIds.uniq)
      body_arr = products.map { |product| "#{product.chinese_name} * #{id_count_hash[product.id]}" }
      return body_arr.join(',')
    end

    def count_duplicate_elements array
      rs_hash = Hash.new(0)
      array.each do |v|
        rs_hash[v] += 1
      end
      rs_hash
    end
end
