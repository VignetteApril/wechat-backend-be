require "test_helper"

describe SubjectsController do
  let(:subject) { subjects(:one) }

  it "should get index" do
    get subjects_url
    must_respond_with :success
  end

  it "should get new" do
    get new_subject_url
    must_respond_with :success
  end

  it "should create subject" do
    assert_difference("Subject.count") do
      post subjects_url, params: { subject: { grade_id: @subject.grade_id, name: @subject.name } }
    end

    must_redirect_to subject_url(Subject.last)
  end

  it "should show subject" do
    get subject_url(@subject)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_subject_url(@subject)
    must_respond_with :success
  end

  it "should update subject" do
    patch subject_url(@subject), params: { subject: { grade_id: @subject.grade_id, name: @subject.name } }
    must_redirect_to subject_url(subject)
  end

  it "should destroy subject" do
    assert_difference("Subject.count", -1) do
      delete subject_url(@subject)
    end

    must_redirect_to subjects_url
  end
end
