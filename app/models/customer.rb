class Customer < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
  has_many :code_customers
  has_many :book_codes, through: :code_customers
  has_many :subjects, through: :book_codes
end
