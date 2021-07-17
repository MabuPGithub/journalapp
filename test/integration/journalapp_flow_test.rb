require "test_helper"

class JournalappFlowTest < ActionDispatch::IntegrationTest
  test "can see the his categories page" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}
    get "/categories"
    assert_response :success
  end
end