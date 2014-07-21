require 'test_helper'

class TblPageBannersControllerTest < ActionController::TestCase
  setup do
    @tbl_page_banner = tbl_page_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_page_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_page_banner" do
    assert_difference('TblPageBanner.count') do
      post :create, tbl_page_banner: { BannerID: @tbl_page_banner.BannerID, PageID: @tbl_page_banner.PageID }
    end

    assert_redirected_to tbl_page_banner_path(assigns(:tbl_page_banner))
  end

  test "should show tbl_page_banner" do
    get :show, id: @tbl_page_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_page_banner
    assert_response :success
  end

  test "should update tbl_page_banner" do
    patch :update, id: @tbl_page_banner, tbl_page_banner: { BannerID: @tbl_page_banner.BannerID, PageID: @tbl_page_banner.PageID }
    assert_redirected_to tbl_page_banner_path(assigns(:tbl_page_banner))
  end

  test "should destroy tbl_page_banner" do
    assert_difference('TblPageBanner.count', -1) do
      delete :destroy, id: @tbl_page_banner
    end

    assert_redirected_to tbl_page_banners_path
  end
end
