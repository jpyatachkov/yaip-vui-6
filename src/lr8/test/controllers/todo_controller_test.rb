require "test_helper"

class TodoControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get todo_list_url
    assert_response :success
  end
end
