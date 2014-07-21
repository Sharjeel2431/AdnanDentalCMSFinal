require 'test_helper'

class TblSlidesControllerTest < ActionController::TestCase
  setup do
    @tbl_slide = tbl_slides(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_slides)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_slide" do
    assert_difference('TblSlide.count') do
      post :create, tbl_slide: { BackgroundImage: @tbl_slide.BackgroundImage, BannerID: @tbl_slide.BannerID, SlideClass: @tbl_slide.SlideClass, SlideDelay: @tbl_slide.SlideDelay, SlideID: @tbl_slide.SlideID, SlideTransition: @tbl_slide.SlideTransition, Transition: @tbl_slide.Transition }
    end

    assert_redirected_to tbl_slide_path(assigns(:tbl_slide))
  end

  test "should show tbl_slide" do
    get :show, id: @tbl_slide
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_slide
    assert_response :success
  end

  test "should update tbl_slide" do
    patch :update, id: @tbl_slide, tbl_slide: { BackgroundImage: @tbl_slide.BackgroundImage, BannerID: @tbl_slide.BannerID, SlideClass: @tbl_slide.SlideClass, SlideDelay: @tbl_slide.SlideDelay, SlideID: @tbl_slide.SlideID, SlideTransition: @tbl_slide.SlideTransition, Transition: @tbl_slide.Transition }
    assert_redirected_to tbl_slide_path(assigns(:tbl_slide))
  end

  test "should destroy tbl_slide" do
    assert_difference('TblSlide.count', -1) do
      delete :destroy, id: @tbl_slide
    end

    assert_redirected_to tbl_slides_path
  end
end
