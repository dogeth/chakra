require 'test_helper'

class ChakrasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chakras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chakra" do
    assert_difference('Chakra.count') do
      post :create, :chakra => { }
    end

    assert_redirected_to chakra_path(assigns(:chakra))
  end

  test "should show chakra" do
    get :show, :id => chakras(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chakras(:one).id
    assert_response :success
  end

  test "should update chakra" do
    put :update, :id => chakras(:one).id, :chakra => { }
    assert_redirected_to chakra_path(assigns(:chakra))
  end

  test "should destroy chakra" do
    assert_difference('Chakra.count', -1) do
      delete :destroy, :id => chakras(:one).id
    end

    assert_redirected_to chakras_path
  end
end
