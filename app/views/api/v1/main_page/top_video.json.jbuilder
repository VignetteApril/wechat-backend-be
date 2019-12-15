json.data do
  json.video_url video_url_for(@top_video.first.img)
end

json.code 0
json.message '请求成功'