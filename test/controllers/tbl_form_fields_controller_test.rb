require 'test_helper'

class TblFormFieldsControllerTest < ActionController::TestCase
  setup do
    @tbl_form_field = tbl_form_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_form_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_form_field" do
    assert_difference('TblFormField.count') do
      post :create, tbl_form_field: { FieldID: @tbl_form_field.FieldID, FieldTitle: @tbl_form_field.FieldTitle, FieldType: @tbl_form_field.FieldType, FieldValue: @tbl_form_field.FieldValue, Status: @tbl_form_field.Status, Tooltip: @tbl_form_field.Tooltip }
    end

    assert_redirected_to tbl_form_field_path(assigns(:tbl_form_field))
  end

  test "should show tbl_form_field" do
    get :show, id: @tbl_form_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_form_field
    assert_response :success
  end

  test "should update tbl_form_field" do
    patch :update, id: @tbl_form_field, tbl_form_field: { FieldID: @tbl_form_field.FieldID, FieldTitle: @tbl_form_field.FieldTitle, FieldType: @tbl_form_field.FieldType, FieldValue: @tbl_form_field.FieldValue, Status: @tbl_form_field.Status, Tooltip: @tbl_form_field.Tooltip }
    assert_redirected_to tbl_form_field_path(assigns(:tbl_form_field))
  end

  test "should destroy tbl_form_field" do
    assert_difference('TblFormField.count', -1) do
      delete :destroy, id: @tbl_form_field
    end

    assert_redirected_to tbl_form_fields_path
  end
end
