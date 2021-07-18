require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  setup do
    users(:one).password = 'pass'
  end

  test "should not save category without details" do
    category = Category.create(user: users(:one))
    assert_not category.save
  end

  test "should create category" do
    user = users(:one)
    category = Category.create(name: "category", description: "detail", user_id: user.id )
    assert category.save
  end

  test "should update category" do
    category = categories(:one)
    category.update(name: 'Category')
    assert category.save
  end

  test "should delete category" do
    category = categories(:one)
    category.destroy
    assert category.destroy
  end
end
