# -*- encoding : utf-8 -*-
class SessionController < ApplicationController
  layout "login", only: [:new, :aologin]
  skip_before_action :authorize, only: [:create, :new, :destroy, :aosignin, :aologin]
  skip_before_action :can, only: [:index, :create, :new, :destroy, :ao, :aologin, :aosignin]
  
  # 显示系统登录之后的首页
  def index
    session[:bread] = [ { "title" => '主页',  "url_str" => root_path() } ]
    session[:bread_clear] = [ root_path() ]
    
    @base_date = SysLog.where(user_id: @current_user.id).order("log_date DESC") # .first.log_date
    make_log(@current_user) if @base_date && !@base_date.empty? && @base_date.first.log_date < RELEASE_NOTES.last['date']
  end
  
  # 显示系统用户登录页面
  def new
  end
  
  # 用户登录信息提交，用户身份验证，成功之后转向系统首页
  def create
    if user = User.authenticate(params[:login], params[:password])
      session[:user_id] = user.id
      user.update(session_id: session.id) if FORBID_SHADOW_LOGIN
      redirect_to root_path
    else
      redirect_to :login, flash: { danger: '用户名或者密码输入错误' }
    end
  end
  
  # 用户注销
  def destroy
    # @current_user.update(session_id: nil) if FORBID_SHADOW_LOGIN
    session[:user_id] = nil
    redirect_to :login, flash: { success: '您已经从系统中注销了' }
  end
end
