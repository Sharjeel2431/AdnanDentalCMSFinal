require 'test_helper'

class TblSlideTransitionsControllerTest < ActionController::TestCase
  setup do
    @tbl_slide_transition = tbl_slide_transitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tbl_slide_transitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tbl_slide_transition" do
    assert_difference('TblSlideTransition.count') do
      post :create, tbl_slide_transition: { SlideID: @tbl_slide_transition.SlideID, TransitionID: @tbl_slide_transition.TransitionID }
    end

    assert_redirected_to tbl_slide_transition_path(assigns(:tbl_slide_transition))
  end

  test "should show tbl_slide_transition" do
    get :show, id: @tbl_slide_transition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tbl_slide_transition
    assert_response :success
  end

  test "should update tbl_slide_transition" do
    patch :update, id: @tbl_slide_transition, tbl_slide_transition: { SlideID: @tbl_slide_transition.SlideID, TransitionID: @tbl_slide_transition.TransitionID }
    assert_redirected_to tbl_slide_transition_path(assigns(:tbl_slide_transition))
  end

  test "should destroy tbl_slide_transition" do
    assert_difference('TblSlideTransition.count', -1) do
      delete :destroy, id: @tbl_slide_transition
    end

    assert_redirected_to tbl_slide_transitions_path
  end
end
