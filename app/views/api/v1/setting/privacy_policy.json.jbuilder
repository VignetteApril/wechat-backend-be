json.data do
  json.image_url static_url_for(@privacy_policy.img)
end
json.code 0
json.message '请求成功'