require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get store_contact_url
    assert_response :success
  end

end
