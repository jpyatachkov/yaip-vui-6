require "test_helper"

class PrivateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get private_index_url
    assert_response :success
  end
end
