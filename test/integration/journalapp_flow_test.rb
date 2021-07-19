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

  test "can add category" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}
    post "/categories",
    params: { category: { name: "can create", description: "category successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can edit category" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}

    temp = categories(:one).name
    patch "/categories/#{categories(:one).id}",
    params: { category: { name: "can't update"} }
    assert_not_equal( "can't update", temp)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can delete category" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}
    delete "/categories/#{categories(:one).id}", params: {category: {
      id: categories(:one).id
    }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can see the his category with task + task priority page" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}
    get "/categories/#{categories(:one).id}"
    assert_response :success
  end
  
  test "can add task" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}
    post "/categories/#{categories(:one).id}/tasks",
    params: { task: { name: "can create", description: "category successfully.", status: "Not started", deadline: "2021-07-19" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "can edit task" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}

    temp = tasks(:one).name
    patch "/categories/#{categories(:one).id}/tasks/#{tasks(:one).id}",
    params: { task: { name: "can't update task"} }
    assert_not_equal( "can't update task", temp)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "signup and login" do
    post user_registration_path,
    params: {user: {
      first_name: "myles", 
      last_name: "mempin", 
      email: "myles@email.com",
      password: "pass"
    }}
    post user_session_path, 
    params: {user: {
        email:    "myles@email.com",
        password: "pass"
    }}
    assert_response :success
  end

  test "can delete task" do
    post user_session_path, params: {user: {
        email:    users(:one).email,
        password: "password"
    }}
    delete "/categories/#{categories(:one).id}/tasks/#{tasks(:one).id}", params: {task: {
      id: tasks(:one).id
    }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end