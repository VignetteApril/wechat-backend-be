class GenerateBookCodeJob < ApplicationJob
  queue_as :generate_book_code

  # params code_num 生成book_code的条数
  # params subject  为哪个subject实例生成code
  def perform(code_num, subject)
    code_num.to_i.times do
      subject.book_codes.create
    end
  end
end
