require "test_helper"

describe CustomersController do
  let(:customer) { customers(:one) }

  it "should get index" do
    get customers_url
    must_respond_with :success
  end

  it "should get new" do
    get new_customer_url
    must_respond_with :success
  end

  it "should create customer" do
    assert_difference("Customer.count") do
      post customers_url, params: { customer: {  } }
    end

    must_redirect_to customer_url(Customer.last)
  end

  it "should show customer" do
    get customer_url(@customer)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_customer_url(@customer)
    must_respond_with :success
  end

  it "should update customer" do
    patch customer_url(@customer), params: { customer: {  } }
    must_redirect_to customer_url(customer)
  end

  it "should destroy customer" do
    assert_difference("Customer.count", -1) do
      delete customer_url(@customer)
    end

    must_redirect_to customers_url
  end
end
