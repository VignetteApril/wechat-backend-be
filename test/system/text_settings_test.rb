require "application_system_test_case"

describe "TextSettings", :system do
  let(:text_setting) { text_settings(:one) }

  it "visiting the index" do
    visit text_settings_url
    assert_selector "h1", text: "Text Settings"
  end

  it "creating a Text setting" do
    visit text_settings_url
    click_on "New Text Setting"

    fill_in "Content", with: @text_setting.content
    fill_in "Content type", with: @text_setting.content_type
    click_on "Create Text setting"

    assert_text "Text setting was successfully created"
    click_on "Back"
  end

  it "updating a Text setting" do
    visit text_settings_url
    click_on "Edit", match: :first

    fill_in "Content", with: @text_setting.content
    fill_in "Content type", with: @text_setting.content_type
    click_on "Update Text setting"

    assert_text "Text setting was successfully updated"
    click_on "Back"
  end

  it "destroying a Text setting" do
    visit text_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Text setting was successfully destroyed"
  end
end
