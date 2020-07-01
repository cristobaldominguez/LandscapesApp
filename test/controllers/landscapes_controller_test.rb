require 'test_helper'

class LandscapesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @landscape = landscapes(:one)
  end

  test "should get index" do
    get landscapes_url
    assert_response :success
  end

  test "should get new" do
    get new_landscape_url
    assert_response :success
  end

  test "should create landscape" do
    assert_difference('Landscape.count') do
      post landscapes_url, params: { landscape: { user_id: @landscape.user_id } }
    end

    assert_redirected_to landscape_url(Landscape.last)
  end

  test "should show landscape" do
    get landscape_url(@landscape)
    assert_response :success
  end

  test "should get edit" do
    get edit_landscape_url(@landscape)
    assert_response :success
  end

  test "should update landscape" do
    patch landscape_url(@landscape), params: { landscape: { user_id: @landscape.user_id } }
    assert_redirected_to landscape_url(@landscape)
  end

  test "should destroy landscape" do
    assert_difference('Landscape.count', -1) do
      delete landscape_url(@landscape)
    end

    assert_redirected_to landscapes_url
  end
end
