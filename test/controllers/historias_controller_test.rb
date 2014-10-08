require 'test_helper'

class HistoriasControllerTest < ActionController::TestCase
  setup do
    @historias = historias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historias" do
    assert_difference('Historia.count') do
      post :create, historias: { id_singularidad: @historias.id_singularidad }
    end

    assert_redirected_to historias_path(assigns(:historias))
  end

  test "should show historias" do
    get :show, id: @historias
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historias
    assert_response :success
  end

  test "should update historias" do
    patch :update, id: @historias, historias: { id_singularidad: @historias.id_singularidad }
    assert_redirected_to historias_path(assigns(:historias))
  end

  test "should destroy historias" do
    assert_difference('Historia.count', -1) do
      delete :destroy, id: @historias
    end

    assert_redirected_to historias_path
  end
end
