require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "admin user should be admin" do
    admin = users(:admin)
    assert admin.isAdmin
  end

  test "default user should not be admin" do
    user = users(:user)
    assert !user.isAdmin
  end

  test "admin role name should be Admin" do
    admin = users(:admin)
    assert admin.role_name == "Admin"
  end

  test "user role name should be User" do
    user = users(:user)
    assert user.role_name == "User"
  end
end
