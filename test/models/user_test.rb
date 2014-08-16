require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user is no admin" do
    admin = users(:admin)
    assert admin.isAdmin, "Admin needs to be admin"
  end

  test "user is admin" do
    user = users(:user)
    assert !user.isAdmin, "Admin may not be admin"
  end
end
