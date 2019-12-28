class Subject < ApplicationRecord
  # relationship
  belongs_to :grade
  has_many :courses, dependent: :destroy
  has_many :book_codes, dependent: :destroy
  has_one_attached :courses_page_cover
  has_one_attached :main_page_cover
  has_many_attached :detail_imgs

  # validates
  validates :code_prefix, length: { is: 2 }, uniqueness: { case_sensitive: false }, format: { with: /\b[A-Z][A-Z]+\b/, message: '只支持大写字母' }, all_blank: false
end
