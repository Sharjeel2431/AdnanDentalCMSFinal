require 'test_helper'

class TblPlaceHoldersControllerTest < ActionController::TestCase
  setup do
    @tbl_place_holder = tbl_place_holders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_place_holders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_place_holder" do
    assert_difference('TblPlaceHolder.count') do
      post :create, tbl_place_holder: { IsActive: @tbl_place_holder.IsActive, PlaceHolderDesc: @tbl_place_holder.PlaceHolderDesc, PlaceHolderID: @tbl_place_holder.PlaceHolderID, PlaceHolderTitle: @tbl_place_holder.PlaceHolderTitle }
    end

    assert_redirected_to tbl_place_holder_path(assigns(:tbl_place_holder))
  end

  test "should show tbl_place_holder" do
    get :show, id: @tbl_place_holder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_place_holder
    assert_response :success
  end

  test "should update tbl_place_holder" do
    patch :update, id: @tbl_place_holder, tbl_place_holder: { IsActive: @tbl_place_holder.IsActive, PlaceHolderDesc: @tbl_place_holder.PlaceHolderDesc, PlaceHolderID: @tbl_place_holder.PlaceHolderID, PlaceHolderTitle: @tbl_place_holder.PlaceHolderTitle }
    assert_redirected_to tbl_place_holder_path(assigns(:tbl_place_holder))
  end

  test "should destroy tbl_place_holder" do
    assert_difference('TblPlaceHolder.count', -1) do
      delete :destroy, id: @tbl_place_holder
    end

    assert_redirected_to tbl_place_holders_path
  end
end
