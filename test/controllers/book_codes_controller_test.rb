require "test_helper"

describe BookCodesController do
  let(:book_code) { book_codes(:one) }

  it "should get index" do
    get book_codes_url
    must_respond_with :success
  end

  it "should get new" do
    get new_book_code_url
    must_respond_with :success
  end

  it "should create book_code" do
    assert_difference("BookCode.count") do
      post book_codes_url, params: { book_code: { code: @book_code.code, course_id: @book_code.course_id, customer_id: @book_code.customer_id } }
    end

    must_redirect_to book_code_url(BookCode.last)
  end

  it "should show book_code" do
    get book_code_url(@book_code)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_book_code_url(@book_code)
    must_respond_with :success
  end

  it "should update book_code" do
    patch book_code_url(@book_code), params: { book_code: { code: @book_code.code, course_id: @book_code.course_id, customer_id: @book_code.customer_id } }
    must_redirect_to book_code_url(book_code)
  end

  it "should destroy book_code" do
    assert_difference("BookCode.count", -1) do
      delete book_code_url(@book_code)
    end

    must_redirect_to book_codes_url
  end
end
