class BookCode < ApplicationRecord
  # relation ship
  belongs_to :subject, dependent: :destroy

  # validates
  validates :code, uniqueness: { case_sensitive: true }

  # call backs
  before_create :create_unique_code

  # call back methods
  def create_unique_code
    loop do
      self.code = SecureRandom.hex(5)
      break unless self.class.exists?(code: self.subject.code_prefix + code)
    end
  end
end
