# -*- encoding : utf-8 -*-

module ApplicationHelper
  # include SLicense
  def admin?
    !(SysConfig.super_roles & @current_user.roles.map{ |r| r.name }).empty?
  end

  # 用户权限验证功能模块
  def can?(controller_name, action_name)
    return true if @current_user.login == 'admin'
    @current_user.roles.each do |r|
      r.features.each do |f|
        return true if f.controller_name == controller_name && f.action_names.split(",").map{|a| a.strip}.include?(action_name)
      end
    end
    return false
  end

  # 获取当前的提醒分类
  def cur_notification_channel(name)
    NOTIFICATION_CHANNELS.each do |n|
      return n if n['name'] == name
    end
    return nil
  end

  # 将utf8编码的原始文件转换成为gbk编码
  def conv_utf8_to_gbk(source, destination)
    s = File.open(source, "r")
    d = File.new(destination, "w+")
    s.each_line do |line|
      d.puts line.encode('gbk', 'utf-8').force_encoding('utf-8')
    end
    d.close
    s.close
  end

  # side bar active class
  def active_class(controller, *controller_name)
      if controller_name.include?(controller.controller_name)
        return 'list-group-item list-group-item-action active'
      else
        return 'list-group-item list-group-item-action'
      end
  end

  # top bar active class
  def top_bar_active_class(controller, *controller_name, action_name )
    if controller_name.include?(controller.controller_name) && action_name == controller.action_name
      return 'nav-link active'
    else
      return 'nav-link'
    end
  end

  def  static_url_for blob_object
    static_url = Rails.env == 'development' ? 'https://static.youleshu.vip/' : 'https://p-static.youleshu.vip/'
    if ((blob_object.is_a? ActiveStorage::Attachment) && !blob_object.nil?) || (!blob_object.nil? && blob_object.attached?)
      static_url + blob_object.key
    else
      ''
    end
  end

  def bool_badge_helper bool_object
    cn_words = bool_object ? '是' : '否'
    span_class = bool_object ? 'success' : 'danger'
    content_tag :span, cn_words, class: "badge badge-#{span_class}"
  end
end
