require "application_system_test_case"

describe "Feedbacks", :system do
  let(:feedbacks) { feedbacks(:one) }

  it "visiting the index" do
    visit feedbacks_url
    assert_selector "h1", text: "Feedbacks"
  end

  it "creating a Feedback" do
    visit feedbacks_url
    click_on "New Feedback"

    fill_in "Customer", with: @feedback.customer_id
    fill_in "Message", with: @feedback.message
    click_on "Create Feedback"

    assert_text "Feedback was successfully created"
    click_on "Back"
  end

  it "updating a Feedback" do
    visit feedbacks_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @feedback.customer_id
    fill_in "Message", with: @feedback.message
    click_on "Update Feedback"

    assert_text "Feedback was successfully updated"
    click_on "Back"
  end

  it "destroying a Feedback" do
    visit feedbacks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Feedback was successfully destroyed"
  end
end
