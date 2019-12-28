class Api::V1::CoursesController < Api::V1::BaseController
  def data
    @banner_data = StaticImage.courses_page_banner.first
    @grade_data = Grade.includes(:subjects).order(:order_no)
  end
end
