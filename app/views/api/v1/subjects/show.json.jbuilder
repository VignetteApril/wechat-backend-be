json.data do
  json.name @subject.name

  json.courses @subject.courses.formal_video.order(order_no: :asc) do |course|
    json.name course.name
    json.video_url   static_url_for(course.video)
    json.video_length course.display_length
  end

  json.sample_video_url   static_url_for(@subject.courses.sample_video.order(order_no: :asc).first.try(:video))
end


json.code 0
json.message '请求成功'