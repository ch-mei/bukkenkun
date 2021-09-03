require 'test_helper'

class QuotationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quotations_index_url
    assert_response :success
  end

  test "should get show" do
    get quotations_show_url
    assert_response :success
  end

  test "should get update" do
    get quotations_update_url
    assert_response :success
  end

end
