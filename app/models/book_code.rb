class BookCode < ApplicationRecord
  belongs_to :subject, dependent: :destroy
end
