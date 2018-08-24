require 'test_helper'

class CustomControllerTest < ActionDispatch::IntegrationTest
  test "should get info" do
    get custom_info_url
    assert_response :success
  end

  test "should get index" do
    get custom_index_url
    assert_response :success
  end

end
