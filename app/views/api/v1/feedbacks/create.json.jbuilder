json.data do
  if @feedback.save
    json.message '反馈保存成功'
  else
    json.message '反馈保存失败'
  end
end

json.code 0