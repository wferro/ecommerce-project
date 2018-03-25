require 'test_helper'

class BrigadeirosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brigadeiros_index_url
    assert_response :success
  end

end
