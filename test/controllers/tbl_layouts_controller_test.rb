require 'test_helper'

class TblLayoutsControllerTest < ActionController::TestCase
  setup do
    @tbl_layout = tbl_layouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_layouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_layout" do
    assert_difference('TblLayout.count') do
      post :create, tbl_layout: { LayoutID: @tbl_layout.LayoutID, LayoutTitle: @tbl_layout.LayoutTitle, Status: @tbl_layout.Status, Type: @tbl_layout.Type, Value: @tbl_layout.Value }
    end

    assert_redirected_to tbl_layout_path(assigns(:tbl_layout))
  end

  test "should show tbl_layout" do
    get :show, id: @tbl_layout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_layout
    assert_response :success
  end

  test "should update tbl_layout" do
    patch :update, id: @tbl_layout, tbl_layout: { LayoutID: @tbl_layout.LayoutID, LayoutTitle: @tbl_layout.LayoutTitle, Status: @tbl_layout.Status, Type: @tbl_layout.Type, Value: @tbl_layout.Value }
    assert_redirected_to tbl_layout_path(assigns(:tbl_layout))
  end

  test "should destroy tbl_layout" do
    assert_difference('TblLayout.count', -1) do
      delete :destroy, id: @tbl_layout
    end

    assert_redirected_to tbl_layouts_path
  end
end
