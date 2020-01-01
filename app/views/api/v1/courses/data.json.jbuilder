json.data do
  json.banner   static_url_for(@banner_data.img)
  json.grades @grade_data do |grade|
    json.name grade.name
    json.subjects grade.subjects do |subject|
      json.id subject.id
      json.name subject.grade.name + subject.name
      json.img_url   static_url_for(subject.courses_page_cover)
    end
  end
end

json.code 0
json.message '请求成功'