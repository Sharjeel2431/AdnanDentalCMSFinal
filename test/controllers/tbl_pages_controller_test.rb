require 'test_helper'

class TblPagesControllerTest < ActionController::TestCase
  setup do
    @tbl_page = tbl_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_page" do
    assert_difference('TblPage.count') do
      post :create, tbl_page: { DateTime: @tbl_page.DateTime, Description: @tbl_page.Description, Keywords: @tbl_page.Keywords, LayoutID: @tbl_page.LayoutID, PageID: @tbl_page.PageID, PageName: @tbl_page.PageName, PageTitle: @tbl_page.PageTitle, PageURL: @tbl_page.PageURL, Status: @tbl_page.Status, Type: @tbl_page.Type }
    end

    assert_redirected_to tbl_page_path(assigns(:tbl_page))
  end

  test "should show tbl_page" do
    get :show, id: @tbl_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_page
    assert_response :success
  end

  test "should update tbl_page" do
    patch :update, id: @tbl_page, tbl_page: { DateTime: @tbl_page.DateTime, Description: @tbl_page.Description, Keywords: @tbl_page.Keywords, LayoutID: @tbl_page.LayoutID, PageID: @tbl_page.PageID, PageName: @tbl_page.PageName, PageTitle: @tbl_page.PageTitle, PageURL: @tbl_page.PageURL, Status: @tbl_page.Status, Type: @tbl_page.Type }
    assert_redirected_to tbl_page_path(assigns(:tbl_page))
  end

  test "should destroy tbl_page" do
    assert_difference('TblPage.count', -1) do
      delete :destroy, id: @tbl_page
    end

    assert_redirected_to tbl_pages_path
  end
end
