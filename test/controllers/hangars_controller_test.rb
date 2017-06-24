require 'test_helper'

class HangarsControllerTest < ActionController::TestCase
  setup do
    @hangar = hangars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hangars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hangar" do
    assert_difference('Hangar.count') do
      post :create, hangar: { first_payment: @hangar.first_payment, last_payment: @hangar.last_payment, leased: @hangar.leased, size: @hangar.size, type: @hangar.type }
    end

    assert_redirected_to hangar_path(assigns(:hangar))
  end

  test "should show hangar" do
    get :show, id: @hangar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hangar
    assert_response :success
  end

  test "should update hangar" do
    patch :update, id: @hangar, hangar: { first_payment: @hangar.first_payment, last_payment: @hangar.last_payment, leased: @hangar.leased, size: @hangar.size, type: @hangar.type }
    assert_redirected_to hangar_path(assigns(:hangar))
  end

  test "should destroy hangar" do
    assert_difference('Hangar.count', -1) do
      delete :destroy, id: @hangar
    end

    assert_redirected_to hangars_path
  end
end
