class Api::V1::MainPageController < Api::V1::BaseController

  def top_video
    @top_video = StaticImage.where(img_type: :main_page_video).order(order_no: :asc)
    @banner_data = StaticImage.main_page_banner.order(order_no: :asc).first
  end

  def subjects
    @subjects = Subject.all.group_by(&:name).each { |_, v| v.sort_by! { |subject| subject.grade.order_no } }
  end
end