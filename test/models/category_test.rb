require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  setup do
    users(:one).password = 'pass'
  end

  test "should not save category without details" do
    category = Category.create(user: users(:one))
    assert_not category.save
  end
end
