require 'test_helper'

class PublicacionesControllerTest < ActionController::TestCase
  setup do
    @publicacione = publicaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicacione" do
    assert_difference('Publicacion.count') do
      post :create, publicacione: { id_autor: @publicacione.id_autor, texto: @publicacione.texto, tipo: @publicacione.tipo, url: @publicacione.url }
    end

    assert_redirected_to publicacione_path(assigns(:publicacione))
  end

  test "should show publicacione" do
    get :show, id: @publicacione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publicacione
    assert_response :success
  end

  test "should update publicacione" do
    patch :update, id: @publicacione, publicacione: { id_autor: @publicacione.id_autor, texto: @publicacione.texto, tipo: @publicacione.tipo, url: @publicacione.url }
    assert_redirected_to publicacione_path(assigns(:publicacione))
  end

  test "should destroy publicacione" do
    assert_difference('Publicacion.count', -1) do
      delete :destroy, id: @publicacione
    end

    assert_redirected_to publicaciones_path
  end
end
