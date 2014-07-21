require 'test_helper'

class TblPageCategoriesControllerTest < ActionController::TestCase
  setup do
    @tbl_page_category = tbl_page_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_page_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_page_category" do
    assert_difference('TblPageCategory.count') do
      post :create, tbl_page_category: { CategoryID: @tbl_page_category.CategoryID, PageID: @tbl_page_category.PageID }
    end

    assert_redirected_to tbl_page_category_path(assigns(:tbl_page_category))
  end

  test "should show tbl_page_category" do
    get :show, id: @tbl_page_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_page_category
    assert_response :success
  end

  test "should update tbl_page_category" do
    patch :update, id: @tbl_page_category, tbl_page_category: { CategoryID: @tbl_page_category.CategoryID, PageID: @tbl_page_category.PageID }
    assert_redirected_to tbl_page_category_path(assigns(:tbl_page_category))
  end

  test "should destroy tbl_page_category" do
    assert_difference('TblPageCategory.count', -1) do
      delete :destroy, id: @tbl_page_category
    end

    assert_redirected_to tbl_page_categories_path
  end
end
