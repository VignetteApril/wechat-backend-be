class Subject < ApplicationRecord
  # relationship
  belongs_to :grade, dependent: :destroy
  has_many :courses
  has_many :book_codes

  # validates
  validates :code_prefix, length: { is: 2 }, uniqueness: { case_sensitive: false }, format: { with: /\b[A-Z][A-Z]+\b/, message: '只支持大写字母' }, all_blank: false

  # instance methods
  # 生成学习码的方法，传入一个数量即可
  # code_num integer 生成的数量
  def generate_book_code code_num
    raise Exception.new('生成学习码的数值不能为空！') unless code_num.is_a?(Integer) && code_num > 0
    code_num.times do
      self.book_codes.create
    end
  end

  # class methods
  # class << self
  #
  # end
end
