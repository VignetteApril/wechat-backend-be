json.data do
  json.image_url static_url_for(@user_agreement.try(:img))
end
json.code 0
json.message '请求成功'