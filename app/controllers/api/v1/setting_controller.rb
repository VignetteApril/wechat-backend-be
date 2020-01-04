class Api::V1::SettingController < Api::V1::BaseController
  def user_agreement
    @user_agreement = StaticImage.where(img_type: :user_agreement).order(order_no: :asc).first
  end

  def privacy_policy
    @privacy_policy = StaticImage.where(img_type: :privacy_policy).order(order_no: :asc).first
  end
end
