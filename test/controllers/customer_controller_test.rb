require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get order" do
    get customer_order_url
    assert_response :success
  end

end
