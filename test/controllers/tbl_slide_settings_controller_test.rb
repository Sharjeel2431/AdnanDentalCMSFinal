require 'test_helper'

class TblSlideSettingsControllerTest < ActionController::TestCase
  setup do
    @tbl_slide_setting = tbl_slide_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_slide_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_slide_setting" do
    assert_difference('TblSlideSetting.count') do
      post :create, tbl_slide_setting: { delayin: @tbl_slide_setting.delayin, durationin: @tbl_slide_setting.durationin, easingin: @tbl_slide_setting.easingin, easingout: @tbl_slide_setting.easingout, fadein: @tbl_slide_setting.fadein, fadeout: @tbl_slide_setting.fadeout, offsetxin: @tbl_slide_setting.offsetxin, offsetxout: @tbl_slide_setting.offsetxout, offsetyin: @tbl_slide_setting.offsetyin, offsetyout: @tbl_slide_setting.offsetyout, rotatein: @tbl_slide_setting.rotatein, rotateout: @tbl_slide_setting.rotateout, transition2d: @tbl_slide_setting.transition2d, transition3d: @tbl_slide_setting.transition3d }
    end

    assert_redirected_to tbl_slide_setting_path(assigns(:tbl_slide_setting))
  end

  test "should show tbl_slide_setting" do
    get :show, id: @tbl_slide_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_slide_setting
    assert_response :success
  end

  test "should update tbl_slide_setting" do
    patch :update, id: @tbl_slide_setting, tbl_slide_setting: { delayin: @tbl_slide_setting.delayin, durationin: @tbl_slide_setting.durationin, easingin: @tbl_slide_setting.easingin, easingout: @tbl_slide_setting.easingout, fadein: @tbl_slide_setting.fadein, fadeout: @tbl_slide_setting.fadeout, offsetxin: @tbl_slide_setting.offsetxin, offsetxout: @tbl_slide_setting.offsetxout, offsetyin: @tbl_slide_setting.offsetyin, offsetyout: @tbl_slide_setting.offsetyout, rotatein: @tbl_slide_setting.rotatein, rotateout: @tbl_slide_setting.rotateout, transition2d: @tbl_slide_setting.transition2d, transition3d: @tbl_slide_setting.transition3d }
    assert_redirected_to tbl_slide_setting_path(assigns(:tbl_slide_setting))
  end

  test "should destroy tbl_slide_setting" do
    assert_difference('TblSlideSetting.count', -1) do
      delete :destroy, id: @tbl_slide_setting
    end

    assert_redirected_to tbl_slide_settings_path
  end
end
