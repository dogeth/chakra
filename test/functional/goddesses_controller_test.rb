require 'test_helper'

class GoddessesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goddesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goddess" do
    assert_difference('Goddess.count') do
      post :create, :goddess => { }
    end

    assert_redirected_to goddess_path(assigns(:goddess))
  end

  test "should show goddess" do
    get :show, :id => goddesses(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => goddesses(:one).id
    assert_response :success
  end

  test "should update goddess" do
    put :update, :id => goddesses(:one).id, :goddess => { }
    assert_redirected_to goddess_path(assigns(:goddess))
  end

  test "should destroy goddess" do
    assert_difference('Goddess.count', -1) do
      delete :destroy, :id => goddesses(:one).id
    end

    assert_redirected_to goddesses_path
  end
end
