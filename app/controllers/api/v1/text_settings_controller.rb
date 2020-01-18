class Api::V1::TextSettingsController < Api::V1::BaseController
  def book_code_comment
    @book_code_comment = TextSetting.input_book_code_comment.first.try(:content)
  end
end
