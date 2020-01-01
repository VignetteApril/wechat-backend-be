class BookCode < ApplicationRecord
  # relation ship
  belongs_to :subject
  has_one :code_customer

  # validates
  validates :code, uniqueness: { case_sensitive: true }

  # call backs
  before_create :create_unique_code

  # call back methods
  def create_unique_code
    loop do
      random_code = SecureRandom.hex(5)
      self.code = "#{self.subject.code_prefix}#{random_code}"
      break unless self.class.exists?(self.code)
    end
  end
end
