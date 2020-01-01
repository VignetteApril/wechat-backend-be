json.code @code
json.message @message

json.data do
  json.subject_id @subject.try(:id)
end