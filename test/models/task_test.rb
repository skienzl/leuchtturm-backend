require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "correct name" do
    zell = harbors(:zell)
    task = Task.new(harbor: zell, name: "Task 1")
    assert task.valid?
  end

  test "name required" do
    task = Task.new()
    assert !task.valid?
    assert task.errors[:name].any?
  end

  test "harbor required" do
    task = Task.new()
    assert !task.valid?
    assert task.errors[:harbor].any?
  end

  test "name length needs to be greater than 5" do
    task = Task.new(name: "yxz")
    assert !task.valid?
    assert task.errors[:name].any?
  end

  test "name length needs to be smaller than 20" do
    task = Task.new(name: "1234567891011121314151617181920")
    assert !task.valid?
    assert task.errors[:name].any?
  end

end
