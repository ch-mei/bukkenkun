require 'test_helper'

class ConstructionShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get construction_shops_new_url
    assert_response :success
  end

  test "should get show" do
    get construction_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get construction_shops_edit_url
    assert_response :success
  end

  test "should get update" do
    get construction_shops_update_url
    assert_response :success
  end

  test "should get destroy" do
    get construction_shops_destroy_url
    assert_response :success
  end

end
