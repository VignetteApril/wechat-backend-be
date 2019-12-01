json.extract! book_code, :id, :code, :customer_id, :course_id, :created_at, :updated_at
json.url book_code_url(book_code, format: :json)
