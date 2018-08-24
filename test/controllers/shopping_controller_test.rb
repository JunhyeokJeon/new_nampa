require 'test_helper'

class ShoppingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shopping_index_url
    assert_response :success
  end

end
