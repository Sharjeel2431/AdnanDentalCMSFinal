require 'test_helper'

class TblSlideSettingBridgesControllerTest < ActionController::TestCase
  setup do
    @tbl_slide_setting_bridge = tbl_slide_setting_bridges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_slide_setting_bridges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_slide_setting_bridge" do
    assert_difference('TblSlideSettingBridge.count') do
      post :create, tbl_slide_setting_bridge: { SlideID: @tbl_slide_setting_bridge.SlideID, SlideSettingID: @tbl_slide_setting_bridge.SlideSettingID }
    end

    assert_redirected_to tbl_slide_setting_bridge_path(assigns(:tbl_slide_setting_bridge))
  end

  test "should show tbl_slide_setting_bridge" do
    get :show, id: @tbl_slide_setting_bridge
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_slide_setting_bridge
    assert_response :success
  end

  test "should update tbl_slide_setting_bridge" do
    patch :update, id: @tbl_slide_setting_bridge, tbl_slide_setting_bridge: { SlideID: @tbl_slide_setting_bridge.SlideID, SlideSettingID: @tbl_slide_setting_bridge.SlideSettingID }
    assert_redirected_to tbl_slide_setting_bridge_path(assigns(:tbl_slide_setting_bridge))
  end

  test "should destroy tbl_slide_setting_bridge" do
    assert_difference('TblSlideSettingBridge.count', -1) do
      delete :destroy, id: @tbl_slide_setting_bridge
    end

    assert_redirected_to tbl_slide_setting_bridges_path
  end
end
