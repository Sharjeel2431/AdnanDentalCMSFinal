require 'test_helper'

class TblBannerMediaControllerTest < ActionController::TestCase
  setup do
    @tbl_banner_medium = tbl_banner_media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_banner_media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_banner_medium" do
    assert_difference('TblBannerMedium.count') do
      post :create, tbl_banner_medium: { BannerID: @tbl_banner_medium.BannerID, MediaID: @tbl_banner_medium.MediaID }
    end

    assert_redirected_to tbl_banner_medium_path(assigns(:tbl_banner_medium))
  end

  test "should show tbl_banner_medium" do
    get :show, id: @tbl_banner_medium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_banner_medium
    assert_response :success
  end

  test "should update tbl_banner_medium" do
    patch :update, id: @tbl_banner_medium, tbl_banner_medium: { BannerID: @tbl_banner_medium.BannerID, MediaID: @tbl_banner_medium.MediaID }
    assert_redirected_to tbl_banner_medium_path(assigns(:tbl_banner_medium))
  end

  test "should destroy tbl_banner_medium" do
    assert_difference('TblBannerMedium.count', -1) do
      delete :destroy, id: @tbl_banner_medium
    end

    assert_redirected_to tbl_banner_media_path
  end
end
