class Subject < ApplicationRecord
  # relationship
  belongs_to :grade
  has_many :courses, dependent: :destroy
  has_many :book_codes, dependent: :destroy

  # validates
  validates :code_prefix, length: { is: 2 }, uniqueness: { case_sensitive: false }, format: { with: /\b[A-Z][A-Z]+\b/, message: '只支持大写字母' }, all_blank: false

  # class methods
  # class << self
  #
  # end
end
