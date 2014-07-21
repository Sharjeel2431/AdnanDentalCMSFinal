require 'test_helper'

class TblLayersControllerTest < ActionController::TestCase
  setup do
    @tbl_layer = tbl_layers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_layers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_layer" do
    assert_difference('TblLayer.count') do
      post :create, tbl_layer: { Class: @tbl_layer.Class, LayerID: @tbl_layer.LayerID, Type: @tbl_layer.Type }
    end

    assert_redirected_to tbl_layer_path(assigns(:tbl_layer))
  end

  test "should show tbl_layer" do
    get :show, id: @tbl_layer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_layer
    assert_response :success
  end

  test "should update tbl_layer" do
    patch :update, id: @tbl_layer, tbl_layer: { Class: @tbl_layer.Class, LayerID: @tbl_layer.LayerID, Type: @tbl_layer.Type }
    assert_redirected_to tbl_layer_path(assigns(:tbl_layer))
  end

  test "should destroy tbl_layer" do
    assert_difference('TblLayer.count', -1) do
      delete :destroy, id: @tbl_layer
    end

    assert_redirected_to tbl_layers_path
  end
end
