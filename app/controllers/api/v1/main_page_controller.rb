class Api::V1::MainPageController < Api::V1::BaseController

  def top_video
    @top_video = StaticImage.where(img_type: :main_page_video).order(order_no: :asc)
  end
end
