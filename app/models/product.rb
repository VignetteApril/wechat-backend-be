class Product < ApplicationRecord
  has_one_attached :small_image
  has_one_attached :normal_image
  has_one_attached :big_image

  has_many :app_images, dependent: :destroy
end
