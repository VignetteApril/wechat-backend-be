# 学习码使用记录模型
# 当用户在前端输入学习码，并点击保存，则创建一个该模型，并更新学习码的状态为已使用
class CodeCustomer < ApplicationRecord
  belongs_to :book_code, dependent: :destroy
  belongs_to :customer

  after_create :update_book_code

  def update_book_code
    self.book_code.update(is_used: true)
  end
end
