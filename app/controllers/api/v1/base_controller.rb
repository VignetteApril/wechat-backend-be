class Api::V1::BaseController < ApplicationController
  # disable the CSRF token
  protect_from_forgery with: :null_session

  # disable cookies (no set-cookies header in response)
  before_action :destroy_session

  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  skip_before_action :can, :authorize


  def destroy_session
    request.session_options[:skip] = true
  end

  def set_customer
    phone_number = JWT.decode(params.delete(:token), nil, false).first
    @customer = Customer.find_by_phone_number(phone_number)
  end
end
