class Grade < ApplicationRecord
  has_many :subjects, dependent: :destroy
end
