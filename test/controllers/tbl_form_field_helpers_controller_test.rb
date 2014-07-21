require 'test_helper'

class TblFormFieldHelpersControllerTest < ActionController::TestCase
  setup do
    @tbl_form_field_helper = tbl_form_field_helpers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_form_field_helpers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_form_field_helper" do
    assert_difference('TblFormFieldHelper.count') do
      post :create, tbl_form_field_helper: { FieldID: @tbl_form_field_helper.FieldID, FormID: @tbl_form_field_helper.FormID }
    end

    assert_redirected_to tbl_form_field_helper_path(assigns(:tbl_form_field_helper))
  end

  test "should show tbl_form_field_helper" do
    get :show, id: @tbl_form_field_helper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_form_field_helper
    assert_response :success
  end

  test "should update tbl_form_field_helper" do
    patch :update, id: @tbl_form_field_helper, tbl_form_field_helper: { FieldID: @tbl_form_field_helper.FieldID, FormID: @tbl_form_field_helper.FormID }
    assert_redirected_to tbl_form_field_helper_path(assigns(:tbl_form_field_helper))
  end

  test "should destroy tbl_form_field_helper" do
    assert_difference('TblFormFieldHelper.count', -1) do
      delete :destroy, id: @tbl_form_field_helper
    end

    assert_redirected_to tbl_form_field_helpers_path
  end
end
