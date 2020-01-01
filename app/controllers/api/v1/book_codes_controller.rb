class Api::V1::BookCodesController < Api::V1::BaseController
  before_action :set_customer, only: [:create]

  def create
    code = params[:code]
    book_code = BookCode.find_by(code: code)
    if book_code.nil?
      @message = '没有找到学习码，请仔细核对学习码'
      @code = 1
    elsif book_code.is_used
      @message = '该学习码已经被使用过了'
      @code = 1
    elsif !book_code.is_actived
      @message = '该学习码还没有被激活'
      @code = 1
    else
      @subject = book_code.subject

      if @customer.subjects.map(&:id).include? @subject.id
        @message = '已经激活过当前课程'
        @code = 1
      else
        @customer.code_customers.create(book_code: book_code)
        @message = '激活课程成功'
        @code = 0
      end
    end
  end
end
