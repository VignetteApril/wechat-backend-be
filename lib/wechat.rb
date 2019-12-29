require 'net/http'

module Wechat
  APP_ID = YAML.load_file(Rails.root.join('config','wechat.yml'))['development']['appid']
  SECRET = YAML.load_file(Rails.root.join('config','wechat.yml'))['development']['secret']

  def auth_code2Session(code)
    uri = URI('https://api.weixin.qq.com/sns/jscode2session')
    params = { appid: APP_ID, secret: SECRET, js_code: code, grant_type: 'authorization_code' }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)
    session_key = JSON.parse(res.body)['session_key']
    open_id = JSON.parse(res.body)['openid']

    return session_key, open_id
  end

  def decryptData(session_key, app_id, encryptedData, iv)
    session_key = Base64.decode64(session_key)
    encrypted_data = Base64.decode64(encryptedData)
    iv = Base64.decode64(iv)

    cipher = OpenSSL::Cipher::AES.new(128, :CBC)
    cipher.decrypt
    cipher.padding = 0
    cipher.key = session_key
    cipher.iv  = iv

    decrypted_plain_text = cipher.update(encrypted_data) + cipher.final
    result = JSON.parse(decrypted_plain_text.strip.gsub(/[\u0000-\u001F\u2028\u2029]/, ''))
    raise '解密错误' if result['watermark']['appid'] != APP_ID
    result['purePhoneNumber']
  end

  def pay_params_data(body, total_fee, spbill_create_ip, openid, out_trade_no)
    body = body[0..50]
    r = prepay_data(body, total_fee, spbill_create_ip, openid, out_trade_no)
    Rails.logger.info r
    if r['return_code'] == 'SUCCESS'
      params = {
          prepayid: r[:raw]['xml']['prepay_id'],
          noncestr: SecureRandom.hex(16),
      }
      pay_params = WxPay::Service.generate_js_pay_req params
      code = 0
      message = '支付接口请求成功！'
      Rails.logger.info pay_params
      return pay_params, code, message
    else
      pay_params = ''
      code = 1
      message = '支付接口请求失败！'
      return pay_params, code, message
    end
  end

  private
  def prepay_data(body, total_fee, spbill_create_ip, openid, out_trade_no)
    pre_pay_params = {
        body: body,
        out_trade_no: out_trade_no,
        total_fee: total_fee.to_i * 100,
        spbill_create_ip: spbill_create_ip,
        notify_url: wechat_pay_notify_api_v1_wechats_url,
        trade_type: 'JSAPI',
        openid: openid
    }
    r = ::WxPay::Service.invoke_unifiedorder pre_pay_params
    r
  end
end