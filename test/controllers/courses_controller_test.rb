require "test_helper"

describe CoursesController do
  let(:course) { courses(:one) }

  it "should get index" do
    get courses_url
    must_respond_with :success
  end

  it "should get new" do
    get new_course_url
    must_respond_with :success
  end

  it "should create course" do
    assert_difference("Course.count") do
      post courses_url, params: { course: { name: @course.name, subject_id: @course.subject_id } }
    end

    must_redirect_to course_url(Course.last)
  end

  it "should show course" do
    get course_url(@course)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_course_url(@course)
    must_respond_with :success
  end

  it "should update course" do
    patch course_url(@course), params: { course: { name: @course.name, subject_id: @course.subject_id } }
    must_redirect_to course_url(course)
  end

  it "should destroy course" do
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    must_redirect_to courses_url
  end
end
