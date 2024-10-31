require "test_helper"

class AgentControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get agent_home_url
    assert_response :success
  end

  test "should get join" do
    get agent_join_url
    assert_response :success
  end
end
