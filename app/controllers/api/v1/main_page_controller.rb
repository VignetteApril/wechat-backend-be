class Api::V1::MainPageController < ApplicationController
  def carousel
    @carousels = StaticImage.where(type: :main_page_banner).order(order_no: :asc)
  end
end
