require 'test_helper'

class TblLayoutPlaceholdersControllerTest < ActionController::TestCase
  setup do
    @tbl_layout_placeholder = tbl_layout_placeholders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_layout_placeholders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_layout_placeholder" do
    assert_difference('TblLayoutPlaceholder.count') do
      post :create, tbl_layout_placeholder: { LayoutID: @tbl_layout_placeholder.LayoutID, PlaceHolderID: @tbl_layout_placeholder.PlaceHolderID }
    end

    assert_redirected_to tbl_layout_placeholder_path(assigns(:tbl_layout_placeholder))
  end

  test "should show tbl_layout_placeholder" do
    get :show, id: @tbl_layout_placeholder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_layout_placeholder
    assert_response :success
  end

  test "should update tbl_layout_placeholder" do
    patch :update, id: @tbl_layout_placeholder, tbl_layout_placeholder: { LayoutID: @tbl_layout_placeholder.LayoutID, PlaceHolderID: @tbl_layout_placeholder.PlaceHolderID }
    assert_redirected_to tbl_layout_placeholder_path(assigns(:tbl_layout_placeholder))
  end

  test "should destroy tbl_layout_placeholder" do
    assert_difference('TblLayoutPlaceholder.count', -1) do
      delete :destroy, id: @tbl_layout_placeholder
    end

    assert_redirected_to tbl_layout_placeholders_path
  end
end
