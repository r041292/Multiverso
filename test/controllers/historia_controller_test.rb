require 'test_helper'

class HistoriaControllerTest < ActionController::TestCase
  setup do
    @historium = historia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historium" do
    assert_difference('Historium.count') do
      post :create, historium: { id_singularidad: @historium.id_singularidad }
    end

    assert_redirected_to historium_path(assigns(:historium))
  end

  test "should show historium" do
    get :show, id: @historium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historium
    assert_response :success
  end

  test "should update historium" do
    patch :update, id: @historium, historium: { id_singularidad: @historium.id_singularidad }
    assert_redirected_to historium_path(assigns(:historium))
  end

  test "should destroy historium" do
    assert_difference('Historium.count', -1) do
      delete :destroy, id: @historium
    end

    assert_redirected_to historia_path
  end
end
