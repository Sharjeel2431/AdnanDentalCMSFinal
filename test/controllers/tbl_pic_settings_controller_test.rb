require 'test_helper'

class TblPicSettingsControllerTest < ActionController::TestCase
  setup do
    @tbl_pic_setting = tbl_pic_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_pic_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_pic_setting" do
    assert_difference('TblPicSetting.count') do
      post :create, tbl_pic_setting: { Constraints: @tbl_pic_setting.Constraints, Height: @tbl_pic_setting.Height, Mode: @tbl_pic_setting.Mode, PicSettingID: @tbl_pic_setting.PicSettingID, Status: @tbl_pic_setting.Status, Title: @tbl_pic_setting.Title, Type: @tbl_pic_setting.Type, Width: @tbl_pic_setting.Width }
    end

    assert_redirected_to tbl_pic_setting_path(assigns(:tbl_pic_setting))
  end

  test "should show tbl_pic_setting" do
    get :show, id: @tbl_pic_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_pic_setting
    assert_response :success
  end

  test "should update tbl_pic_setting" do
    patch :update, id: @tbl_pic_setting, tbl_pic_setting: { Constraints: @tbl_pic_setting.Constraints, Height: @tbl_pic_setting.Height, Mode: @tbl_pic_setting.Mode, PicSettingID: @tbl_pic_setting.PicSettingID, Status: @tbl_pic_setting.Status, Title: @tbl_pic_setting.Title, Type: @tbl_pic_setting.Type, Width: @tbl_pic_setting.Width }
    assert_redirected_to tbl_pic_setting_path(assigns(:tbl_pic_setting))
  end

  test "should destroy tbl_pic_setting" do
    assert_difference('TblPicSetting.count', -1) do
      delete :destroy, id: @tbl_pic_setting
    end

    assert_redirected_to tbl_pic_settings_path
  end
end
