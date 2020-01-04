json.data do
  json.id @subject.id
  json.name @subject.name
  json.detail_images @subject.detail_imgs.order(created_at: :asc) do |detail_image|
    json.image_url static_url_for(detail_image)
  end

  json.courses @subject.courses.formal_video.order(order_no: :asc) do |course|
    json.id course.id
    json.name course.name
    json.video_type course.course_type
    json.video_url   static_url_for(course.video)
    json.video_length course.display_length
  end

  json.sample_video_url static_url_for(@subject.courses.sample_video.order(order_no: :asc).first.try(:video))
end


json.code 0
json.message '请求成功'