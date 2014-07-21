require 'test_helper'

class TblPageFormsControllerTest < ActionController::TestCase
  setup do
    @tbl_page_form = tbl_page_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_page_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_page_form" do
    assert_difference('TblPageForm.count') do
      post :create, tbl_page_form: { FormID: @tbl_page_form.FormID, PageID: @tbl_page_form.PageID }
    end

    assert_redirected_to tbl_page_form_path(assigns(:tbl_page_form))
  end

  test "should show tbl_page_form" do
    get :show, id: @tbl_page_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_page_form
    assert_response :success
  end

  test "should update tbl_page_form" do
    patch :update, id: @tbl_page_form, tbl_page_form: { FormID: @tbl_page_form.FormID, PageID: @tbl_page_form.PageID }
    assert_redirected_to tbl_page_form_path(assigns(:tbl_page_form))
  end

  test "should destroy tbl_page_form" do
    assert_difference('TblPageForm.count', -1) do
      delete :destroy, id: @tbl_page_form
    end

    assert_redirected_to tbl_page_forms_path
  end
end
