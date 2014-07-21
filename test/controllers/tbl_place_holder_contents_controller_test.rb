require 'test_helper'

class TblPlaceHolderContentsControllerTest < ActionController::TestCase
  setup do
    @tbl_place_holder_content = tbl_place_holder_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_place_holder_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_place_holder_content" do
    assert_difference('TblPlaceHolderContent.count') do
      post :create, tbl_place_holder_content: { ContentID: @tbl_place_holder_content.ContentID, PlaceHolderID: @tbl_place_holder_content.PlaceHolderID }
    end

    assert_redirected_to tbl_place_holder_content_path(assigns(:tbl_place_holder_content))
  end

  test "should show tbl_place_holder_content" do
    get :show, id: @tbl_place_holder_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_place_holder_content
    assert_response :success
  end

  test "should update tbl_place_holder_content" do
    patch :update, id: @tbl_place_holder_content, tbl_place_holder_content: { ContentID: @tbl_place_holder_content.ContentID, PlaceHolderID: @tbl_place_holder_content.PlaceHolderID }
    assert_redirected_to tbl_place_holder_content_path(assigns(:tbl_place_holder_content))
  end

  test "should destroy tbl_place_holder_content" do
    assert_difference('TblPlaceHolderContent.count', -1) do
      delete :destroy, id: @tbl_place_holder_content
    end

    assert_redirected_to tbl_place_holder_contents_path
  end
end
