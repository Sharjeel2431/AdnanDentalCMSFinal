require 'test_helper'

class TblMediaControllerTest < ActionController::TestCase
  setup do
    @tbl_medium = tbl_media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_medium" do
    assert_difference('TblMedium.count') do
      post :create, tbl_medium: { MediaID: @tbl_medium.MediaID, RedirectLink: @tbl_medium.RedirectLink, Status: @tbl_medium.Status, ToolTip: @tbl_medium.ToolTip, Type: @tbl_medium.Type, Value2: @tbl_medium.Value2, Value: @tbl_medium.Value }
    end

    assert_redirected_to tbl_medium_path(assigns(:tbl_medium))
  end

  test "should show tbl_medium" do
    get :show, id: @tbl_medium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_medium
    assert_response :success
  end

  test "should update tbl_medium" do
    patch :update, id: @tbl_medium, tbl_medium: { MediaID: @tbl_medium.MediaID, RedirectLink: @tbl_medium.RedirectLink, Status: @tbl_medium.Status, ToolTip: @tbl_medium.ToolTip, Type: @tbl_medium.Type, Value2: @tbl_medium.Value2, Value: @tbl_medium.Value }
    assert_redirected_to tbl_medium_path(assigns(:tbl_medium))
  end

  test "should destroy tbl_medium" do
    assert_difference('TblMedium.count', -1) do
      delete :destroy, id: @tbl_medium
    end

    assert_redirected_to tbl_media_path
  end
end
