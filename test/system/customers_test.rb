require "application_system_test_case"

describe "Customers", :system do
  let(:customer) { customers(:one) }

  it "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  it "creating a Customer" do
    visit customers_url
    click_on "New Customer"

    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  it "updating a Customer" do
    visit customers_url
    click_on "Edit", match: :first

    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  it "destroying a Customer" do
    visit customers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer was successfully destroyed"
  end
end
