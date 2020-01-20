json.data @subjects do |k, v|
  json.section_title k
  json.subjects v do |subject|
    json.id subject.id
    json.name subject.name
    json.main_desc subject.main_desc.nil? ? '含视频教程' : subject.main_desc
    json.img_url   static_url_for(subject.main_page_cover)
  end
end

json.code 0
json.message '请求成功'