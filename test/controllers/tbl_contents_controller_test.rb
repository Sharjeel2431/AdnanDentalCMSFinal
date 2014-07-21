require 'test_helper'

class TblContentsControllerTest < ActionController::TestCase
  setup do
    @tbl_content = tbl_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_content" do
    assert_difference('TblContent.count') do
      post :create, tbl_content: { ContentID: @tbl_content.ContentID, ContentName: @tbl_content.ContentName, ContentStatus: @tbl_content.ContentStatus, ContentType: @tbl_content.ContentType, ContentValue: @tbl_content.ContentValue }
    end

    assert_redirected_to tbl_content_path(assigns(:tbl_content))
  end

  test "should show tbl_content" do
    get :show, id: @tbl_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_content
    assert_response :success
  end

  test "should update tbl_content" do
    patch :update, id: @tbl_content, tbl_content: { ContentID: @tbl_content.ContentID, ContentName: @tbl_content.ContentName, ContentStatus: @tbl_content.ContentStatus, ContentType: @tbl_content.ContentType, ContentValue: @tbl_content.ContentValue }
    assert_redirected_to tbl_content_path(assigns(:tbl_content))
  end

  test "should destroy tbl_content" do
    assert_difference('TblContent.count', -1) do
      delete :destroy, id: @tbl_content
    end

    assert_redirected_to tbl_contents_path
  end
end
