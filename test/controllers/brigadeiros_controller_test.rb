require 'test_helper'

class BrigadeirosControllerTest < ActionDispatch::IntegrationTest
  test "should get detail" do
    get brigadeiros_detail_url
    assert_response :success
  end

end
