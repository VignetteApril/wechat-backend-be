class Course < ApplicationRecord
  belongs_to :subject

  has_one_attached :video
end
