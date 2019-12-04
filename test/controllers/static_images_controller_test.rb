require "test_helper"

describe StaticImagesController do
  let(:static_image) { static_images(:one) }

  it "should get index" do
    get static_images_url
    must_respond_with :success
  end

  it "should get new" do
    get new_static_image_url
    must_respond_with :success
  end

  it "should create static_image" do
    assert_difference("StaticImage.count") do
      post static_images_url, params: { static_image: { img_type: @static_image.img_type, order_no: @static_image.order_no } }
    end

    must_redirect_to static_image_url(StaticImage.last)
  end

  it "should show static_image" do
    get static_image_url(@static_image)
    must_respond_with :success
  end

  it "should get edit" do
    get edit_static_image_url(@static_image)
    must_respond_with :success
  end

  it "should update static_image" do
    patch static_image_url(@static_image), params: { static_image: { img_type: @static_image.img_type, order_no: @static_image.order_no } }
    must_redirect_to static_image_url(static_image)
  end

  it "should destroy static_image" do
    assert_difference("StaticImage.count", -1) do
      delete static_image_url(@static_image)
    end

    must_redirect_to static_images_url
  end
end
