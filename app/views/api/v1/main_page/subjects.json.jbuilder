json.data @subjects do |k, v|
  json.section_title k
  json.subjects v do |subject|
    json.id subject.id
    json.name subject.name
    json.img_url   static_url_for(subject.main_page_cover)
  end
end

json.code 0
json.message '请求成功'