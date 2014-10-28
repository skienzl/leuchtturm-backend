require 'test_helper'

class RegionsControllerTest < ActionController::TestCase
=begin

  setup do
    @region = regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region" do
    assert_difference('Region.count') do
      post :create, region: { accuracy: @region.accuracy, collection_id: @region.collection_id, description: @region.description, harbor_id: @region.harbor_id, identifier: @region.identifier, lat: @region.lat, lon: @region.lon, major: @region.major, minor: @region.minor, name: @region.name, next_id: @region.next_id, prev_id: @region.prev_id, shape: @region.shape, task_id: @region.task_id, technology: @region.technology }
    end

    assert_redirected_to region_path(assigns(:region))
  end

  test "should show region" do
    get :show, id: @region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region
    assert_response :success
  end

  test "should update region" do
    patch :update, id: @region, region: { accuracy: @region.accuracy, collection_id: @region.collection_id, description: @region.description, harbor_id: @region.harbor_id, identifier: @region.identifier, lat: @region.lat, lon: @region.lon, major: @region.major, minor: @region.minor, name: @region.name, next_id: @region.next_id, prev_id: @region.prev_id, shape: @region.shape, task_id: @region.task_id, technology: @region.technology }
    assert_redirected_to region_path(assigns(:region))
  end

  test "should destroy region" do
    assert_difference('Region.count', -1) do
      delete :destroy, id: @region
    end

    assert_redirected_to regions_path
  end
=end
end
