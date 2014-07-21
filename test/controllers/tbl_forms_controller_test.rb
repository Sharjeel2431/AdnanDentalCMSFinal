require 'test_helper'

class TblFormsControllerTest < ActionController::TestCase
  setup do
    @tbl_form = tbl_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_form" do
    assert_difference('TblForm.count') do
      post :create, tbl_form: { FormDescription: @tbl_form.FormDescription, FormID: @tbl_form.FormID, FormTitle: @tbl_form.FormTitle, Status: @tbl_form.Status, Type: @tbl_form.Type }
    end

    assert_redirected_to tbl_form_path(assigns(:tbl_form))
  end

  test "should show tbl_form" do
    get :show, id: @tbl_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_form
    assert_response :success
  end

  test "should update tbl_form" do
    patch :update, id: @tbl_form, tbl_form: { FormDescription: @tbl_form.FormDescription, FormID: @tbl_form.FormID, FormTitle: @tbl_form.FormTitle, Status: @tbl_form.Status, Type: @tbl_form.Type }
    assert_redirected_to tbl_form_path(assigns(:tbl_form))
  end

  test "should destroy tbl_form" do
    assert_difference('TblForm.count', -1) do
      delete :destroy, id: @tbl_form
    end

    assert_redirected_to tbl_forms_path
  end
end
