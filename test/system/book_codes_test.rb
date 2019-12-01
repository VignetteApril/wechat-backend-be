require "application_system_test_case"

describe "BookCodes", :system do
  let(:book_code) { book_codes(:one) }

  it "visiting the index" do
    visit book_codes_url
    assert_selector "h1", text: "Book Codes"
  end

  it "creating a Book code" do
    visit book_codes_url
    click_on "New Book Code"

    fill_in "Code", with: @book_code.code
    fill_in "Course", with: @book_code.course_id
    fill_in "Customer", with: @book_code.customer_id
    click_on "Create Book code"

    assert_text "Book code was successfully created"
    click_on "Back"
  end

  it "updating a Book code" do
    visit book_codes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @book_code.code
    fill_in "Course", with: @book_code.course_id
    fill_in "Customer", with: @book_code.customer_id
    click_on "Update Book code"

    assert_text "Book code was successfully updated"
    click_on "Back"
  end

  it "destroying a Book code" do
    visit book_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book code was successfully destroyed"
  end
end
