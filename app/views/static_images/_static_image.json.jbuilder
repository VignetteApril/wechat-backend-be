json.extract! static_image, :id, :img_type, :order_no, :created_at, :updated_at
json.url static_image_url(static_image, format: :json)
