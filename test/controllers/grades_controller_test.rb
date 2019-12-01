require "test_helper"

describe GradesController do
  let(:grade) { grades(:one) }

  it "should get index" do
    get grades_url
    must_respond_with :success
  end

  it "should get new" do
    get new_grade_url
    must_respond_with :success
  end

  it "should create grade" do
    assert_difference("Grade.count") do
      post grades_url, params: { grade: { name: @grade.name } }
    end

    must_redirect_to grade_url(Grade.last)
  end

  it "should show grade" do
    get grade_url(@grade)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_grade_url(@grade)
    must_respond_with :success
  end

  it "should update grade" do
    patch grade_url(@grade), params: { grade: { name: @grade.name } }
    must_redirect_to grade_url(grade)
  end

  it "should destroy grade" do
    assert_difference("Grade.count", -1) do
      delete grade_url(@grade)
    end

    must_redirect_to grades_url
  end
end
