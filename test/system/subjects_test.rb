require "application_system_test_case"

describe "Subjects", :system do
  let(:subject) { subjects(:one) }

  it "visiting the index" do
    visit subjects_url
    assert_selector "h1", text: "Subjects"
  end

  it "creating a Subject" do
    visit subjects_url
    click_on "New Subject"

    fill_in "Grade", with: @subject.grade_id
    fill_in "Name", with: @subject.name
    click_on "Create Subject"

    assert_text "Subject was successfully created"
    click_on "Back"
  end

  it "updating a Subject" do
    visit subjects_url
    click_on "Edit", match: :first

    fill_in "Grade", with: @subject.grade_id
    fill_in "Name", with: @subject.name
    click_on "Update Subject"

    assert_text "Subject was successfully updated"
    click_on "Back"
  end

  it "destroying a Subject" do
    visit subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subject was successfully destroyed"
  end
end
