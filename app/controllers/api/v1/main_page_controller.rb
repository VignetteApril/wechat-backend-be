class Api::V1::MainPageController < Api::V1::BaseController
  before_action :set_prefix_url, only: [:top_video]

  def top_video
    @top_video = StaticImage.where(img_type: :main_page_video).order(order_no: :asc)
  end

  private
    def set_prefix_url
      @prefix_url = request.host_with_port
    end
end
