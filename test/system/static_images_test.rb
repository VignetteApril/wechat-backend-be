require "application_system_test_case"

describe "StaticImages", :system do
  let(:static_image) { static_images(:one) }

  it "visiting the index" do
    visit static_images_url
    assert_selector "h1", text: "Static Images"
  end

  it "creating a Static image" do
    visit static_images_url
    click_on "New Static Image"

    fill_in "Img type", with: @static_image.img_type
    fill_in "Order no", with: @static_image.order_no
    click_on "Create Static image"

    assert_text "Static image was successfully created"
    click_on "Back"
  end

  it "updating a Static image" do
    visit static_images_url
    click_on "Edit", match: :first

    fill_in "Img type", with: @static_image.img_type
    fill_in "Order no", with: @static_image.order_no
    click_on "Update Static image"

    assert_text "Static image was successfully updated"
    click_on "Back"
  end

  it "destroying a Static image" do
    visit static_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Static image was successfully destroyed"
  end
end
