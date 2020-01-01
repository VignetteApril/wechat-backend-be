require "test_helper"

describe FeedbacksController do
  let(:feedbacks) { feedbacks(:one) }

  it "should get index" do
    get feedbacks_url
    must_respond_with :success
  end

  it "should get new" do
    get new_feedback_url
    must_respond_with :success
  end

  it "should create feedbacks" do
    assert_difference("Feedback.count") do
      post feedbacks_url, params: {feedbacks: {customer_id: @feedback.customer_id, message: @feedback.message } }
    end

    must_redirect_to feedback_url(Feedback.last)
  end

  it "should show feedbacks" do
    get feedback_url(@feedback)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_feedback_url(@feedback)
    must_respond_with :success
  end

  it "should update feedbacks" do
    patch feedback_url(@feedback), params: {feedbacks: {customer_id: @feedback.customer_id, message: @feedback.message } }
    must_redirect_to feedback_url(feedback)
  end

  it "should destroy feedbacks" do
    assert_difference("Feedback.count", -1) do
      delete feedback_url(@feedback)
    end

    must_redirect_to feedbacks_url
  end
end
