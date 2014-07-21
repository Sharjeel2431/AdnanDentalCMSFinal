require 'test_helper'

class TblBannersControllerTest < ActionController::TestCase
  setup do
    @tbl_banner = tbl_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_banner" do
    assert_difference('TblBanner.count') do
      post :create, tbl_banner: { BannerID: @tbl_banner.BannerID, Description: @tbl_banner.Description, RedirectLink: @tbl_banner.RedirectLink, Status: @tbl_banner.Status, Title: @tbl_banner.Title, ToolTip: @tbl_banner.ToolTip, Type: @tbl_banner.Type }
    end

    assert_redirected_to tbl_banner_path(assigns(:tbl_banner))
  end

  test "should show tbl_banner" do
    get :show, id: @tbl_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_banner
    assert_response :success
  end

  test "should update tbl_banner" do
    patch :update, id: @tbl_banner, tbl_banner: { BannerID: @tbl_banner.BannerID, Description: @tbl_banner.Description, RedirectLink: @tbl_banner.RedirectLink, Status: @tbl_banner.Status, Title: @tbl_banner.Title, ToolTip: @tbl_banner.ToolTip, Type: @tbl_banner.Type }
    assert_redirected_to tbl_banner_path(assigns(:tbl_banner))
  end

  test "should destroy tbl_banner" do
    assert_difference('TblBanner.count', -1) do
      delete :destroy, id: @tbl_banner
    end

    assert_redirected_to tbl_banners_path
  end
end
