require 'test_helper'

class TblSlideLayersControllerTest < ActionController::TestCase
  setup do
    @tbl_slide_layer = tbl_slide_layers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_slide_layers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_slide_layer" do
    assert_difference('TblSlideLayer.count') do
      post :create, tbl_slide_layer: { LayerID: @tbl_slide_layer.LayerID, SlideID: @tbl_slide_layer.SlideID }
    end

    assert_redirected_to tbl_slide_layer_path(assigns(:tbl_slide_layer))
  end

  test "should show tbl_slide_layer" do
    get :show, id: @tbl_slide_layer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_slide_layer
    assert_response :success
  end

  test "should update tbl_slide_layer" do
    patch :update, id: @tbl_slide_layer, tbl_slide_layer: { LayerID: @tbl_slide_layer.LayerID, SlideID: @tbl_slide_layer.SlideID }
    assert_redirected_to tbl_slide_layer_path(assigns(:tbl_slide_layer))
  end

  test "should destroy tbl_slide_layer" do
    assert_difference('TblSlideLayer.count', -1) do
      delete :destroy, id: @tbl_slide_layer
    end

    assert_redirected_to tbl_slide_layers_path
  end
end
