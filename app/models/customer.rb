class Customer < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
end
