require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without details" do
    category = Category.new
    assert_not category.save
  end
end
