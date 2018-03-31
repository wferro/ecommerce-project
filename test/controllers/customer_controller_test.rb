require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get cart" do
    get customer_cart_url
    assert_response :success
  end

end
