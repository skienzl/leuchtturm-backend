require 'test_helper'

class HarborsControllerTest < ActionController::TestCase
  setup do
    @harbor = harbors(:zell)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:harbors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create harbor" do
    assert_difference('Harbor.count') do
      post :create, harbor: { description: @harbor.description, name: @harbor.name }
    end

    assert_redirected_to harbor_path(assigns(:harbor))
  end

  test "should show harbor" do
    get :show, id: @harbor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @harbor
    assert_response :success
  end

  test "should update harbor" do
    patch :update, id: @harbor, harbor: { description: @harbor.description, name: @harbor.name }
    assert_redirected_to harbor_path(assigns(:harbor))
  end

  test "should destroy harbor" do
    assert_difference('Harbor.count', -1) do
      delete :destroy, id: @harbor
    end

    assert_redirected_to harbors_path
  end
end
