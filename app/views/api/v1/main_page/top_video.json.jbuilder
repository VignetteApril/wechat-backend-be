json.data do
  json.video_url   static_url_for(@top_video.first.img)
  json.banner static_url_for(@banner_data.img)
end

json.code 0
json.message '请求成功'