require "test_helper"

class McpControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mcp_create_url
    assert_response :success
  end
end
