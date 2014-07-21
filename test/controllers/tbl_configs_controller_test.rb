require 'test_helper'

class TblConfigsControllerTest < ActionController::TestCase
  setup do
    @tbl_config = tbl_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_config" do
    assert_difference('TblConfig.count') do
      post :create, tbl_config: { ConfigID: @tbl_config.ConfigID, ConfigTitle: @tbl_config.ConfigTitle, ConfigValue: @tbl_config.ConfigValue, Status: @tbl_config.Status, Type: @tbl_config.Type }
    end

    assert_redirected_to tbl_config_path(assigns(:tbl_config))
  end

  test "should show tbl_config" do
    get :show, id: @tbl_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_config
    assert_response :success
  end

  test "should update tbl_config" do
    patch :update, id: @tbl_config, tbl_config: { ConfigID: @tbl_config.ConfigID, ConfigTitle: @tbl_config.ConfigTitle, ConfigValue: @tbl_config.ConfigValue, Status: @tbl_config.Status, Type: @tbl_config.Type }
    assert_redirected_to tbl_config_path(assigns(:tbl_config))
  end

  test "should destroy tbl_config" do
    assert_difference('TblConfig.count', -1) do
      delete :destroy, id: @tbl_config
    end

    assert_redirected_to tbl_configs_path
  end
end
