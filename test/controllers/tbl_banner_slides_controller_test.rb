require 'test_helper'

class TblBannerSlidesControllerTest < ActionController::TestCase
  setup do
    @tbl_banner_slide = tbl_banner_slides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_banner_slides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_banner_slide" do
    assert_difference('TblBannerSlide.count') do
      post :create, tbl_banner_slide: { BannerID: @tbl_banner_slide.BannerID, SlideID: @tbl_banner_slide.SlideID }
    end

    assert_redirected_to tbl_banner_slide_path(assigns(:tbl_banner_slide))
  end

  test "should show tbl_banner_slide" do
    get :show, id: @tbl_banner_slide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_banner_slide
    assert_response :success
  end

  test "should update tbl_banner_slide" do
    patch :update, id: @tbl_banner_slide, tbl_banner_slide: { BannerID: @tbl_banner_slide.BannerID, SlideID: @tbl_banner_slide.SlideID }
    assert_redirected_to tbl_banner_slide_path(assigns(:tbl_banner_slide))
  end

  test "should destroy tbl_banner_slide" do
    assert_difference('TblBannerSlide.count', -1) do
      delete :destroy, id: @tbl_banner_slide
    end

    assert_redirected_to tbl_banner_slides_path
  end
end
