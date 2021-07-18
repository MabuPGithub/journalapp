require "test_helper"

class TaskTest < ActiveSupport::TestCase
  
  test "should not save task missing details" do
    user = users(:one)
    category = categories(:one)
    task = Task.create()
    assert_not task.save
  end

  test "should create task" do
    user = users(:one)
    category = categories(:one)
    task = Task.create(name: "task", description: "detail", user_id: user.id, category_id: category.id, status: "complete", deadline: "2021-07-19" )
    assert task.save
  end

  test "should update task" do
    task = tasks(:one)
    task.update(name: 'task')
    assert task.save
  end

  test "should delete task" do
    task = tasks(:one)
    task.destroy
    assert task.destroy
  end
end
