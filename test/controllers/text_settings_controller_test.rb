require "test_helper"

describe TextSettingsController do
  let(:text_setting) { text_settings(:one) }

  it "should get index" do
    get text_settings_url
    must_respond_with :success
  end

  it "should get new" do
    get new_text_setting_url
    must_respond_with :success
  end

  it "should create text_setting" do
    assert_difference("TextSetting.count") do
      post text_settings_url, params: { text_setting: { content: @text_setting.content, content_type: @text_setting.content_type } }
    end

    must_redirect_to text_setting_url(TextSetting.last)
  end

  it "should show text_setting" do
    get text_setting_url(@text_setting)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_text_setting_url(@text_setting)
    must_respond_with :success
  end

  it "should update text_setting" do
    patch text_setting_url(@text_setting), params: { text_setting: { content: @text_setting.content, content_type: @text_setting.content_type } }
    must_redirect_to text_setting_url(text_setting)
  end

  it "should destroy text_setting" do
    assert_difference("TextSetting.count", -1) do
      delete text_setting_url(@text_setting)
    end

    must_redirect_to text_settings_url
  end
end
