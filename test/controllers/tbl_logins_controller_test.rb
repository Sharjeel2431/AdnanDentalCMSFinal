require 'test_helper'

class TblLoginsControllerTest < ActionController::TestCase
  setup do
    @tbl_login = tbl_logins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_login" do
    assert_difference('TblLogin.count') do
      post :create, tbl_login: { Password: @tbl_login.Password, UserName: @tbl_login.UserName }
    end

    assert_redirected_to tbl_login_path(assigns(:tbl_login))
  end

  test "should show tbl_login" do
    get :show, id: @tbl_login
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_login
    assert_response :success
  end

  test "should update tbl_login" do
    patch :update, id: @tbl_login, tbl_login: { Password: @tbl_login.Password, UserName: @tbl_login.UserName }
    assert_redirected_to tbl_login_path(assigns(:tbl_login))
  end

  test "should destroy tbl_login" do
    assert_difference('TblLogin.count', -1) do
      delete :destroy, id: @tbl_login
    end

    assert_redirected_to tbl_logins_path
  end
end
