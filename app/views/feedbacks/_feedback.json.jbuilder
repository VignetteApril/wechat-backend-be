json.extract! feedback, :id, :message, :customer_id, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
