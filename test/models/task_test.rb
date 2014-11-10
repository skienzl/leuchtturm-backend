require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "correct name" do
    zell = scopes(:zell)
    task = Task.new(scope: zell, name: "Task 1")
    assert task.valid?
  end

  test "name required" do
    task = Task.new()
    assert !task.valid?
    assert task.errors[:name].any?
  end

  test "scope required" do
    task = Task.new()
    assert !task.valid?
    assert task.errors[:scope].any?
  end

  test "name length needs to be greater than 5" do
    task = Task.new(name: "yxz")
    assert !task.valid?
    assert task.errors[:name].any?
  end

end
