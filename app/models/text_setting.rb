class TextSetting < ApplicationRecord
  enum content_type: %i[input_book_code_comment]
end
