require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without details" do
    user = User.create()
    assert_not user.save
  end
end
