json.data @subjects do |grade, subjects|
    json.name grade.name
    json.subjects subjects.uniq do |subject|
      json.id subject.id
      json.name subject.grade.name + subject.name
      json.img_url static_url_for(subject.main_page_cover)
    end
end

json.code 0
json.message '接口请求成功'