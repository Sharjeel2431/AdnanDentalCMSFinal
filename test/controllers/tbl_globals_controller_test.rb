require 'test_helper'

class TblGlobalsControllerTest < ActionController::TestCase
  setup do
    @tbl_global = tbl_globals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_globals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_global" do
    assert_difference('TblGlobal.count') do
      post :create, tbl_global: { Name: @tbl_global.Name, Status: @tbl_global.Status, Token: @tbl_global.Token }
    end

    assert_redirected_to tbl_global_path(assigns(:tbl_global))
  end

  test "should show tbl_global" do
    get :show, id: @tbl_global
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_global
    assert_response :success
  end

  test "should update tbl_global" do
    patch :update, id: @tbl_global, tbl_global: { Name: @tbl_global.Name, Status: @tbl_global.Status, Token: @tbl_global.Token }
    assert_redirected_to tbl_global_path(assigns(:tbl_global))
  end

  test "should destroy tbl_global" do
    assert_difference('TblGlobal.count', -1) do
      delete :destroy, id: @tbl_global
    end

    assert_redirected_to tbl_globals_path
  end
end
