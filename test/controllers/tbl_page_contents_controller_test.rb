require 'test_helper'

class TblPageContentsControllerTest < ActionController::TestCase
  setup do
    @tbl_page_content = tbl_page_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_page_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_page_content" do
    assert_difference('TblPageContent.count') do
      post :create, tbl_page_content: { ContentID: @tbl_page_content.ContentID, PageID: @tbl_page_content.PageID }
    end

    assert_redirected_to tbl_page_content_path(assigns(:tbl_page_content))
  end

  test "should show tbl_page_content" do
    get :show, id: @tbl_page_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_page_content
    assert_response :success
  end

  test "should update tbl_page_content" do
    patch :update, id: @tbl_page_content, tbl_page_content: { ContentID: @tbl_page_content.ContentID, PageID: @tbl_page_content.PageID }
    assert_redirected_to tbl_page_content_path(assigns(:tbl_page_content))
  end

  test "should destroy tbl_page_content" do
    assert_difference('TblPageContent.count', -1) do
      delete :destroy, id: @tbl_page_content
    end

    assert_redirected_to tbl_page_contents_path
  end
end
