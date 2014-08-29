require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "correct name" do
    task = tasks(:task_beacontask1)
    activity = Activity.new(name: "Activity 1", task: task, identifier: "abcdefg")
    assert activity.valid?
  end

  test "name required" do
    activity = Activity.new()
    assert !activity.valid?
    assert activity.errors[:name].any?
  end

  test "task required" do
    activity = Activity.new()
    assert !activity.valid?
    assert activity.errors[:task].any?
  end

  test "identifier required" do
    activity = Activity.new()
    assert !activity.valid?
    assert activity.errors[:identifier].any?
  end

  test "name length needs to be greater than 5" do
    task = tasks(:task_beacontask1)
    activity = Activity.new(name: "yxz", task: task, identifier: "abcdefg")
    assert !activity.valid?
    assert activity.errors[:name].any?
  end

  test "name length needs to be smaller than 20" do
    task = tasks(:task_beacontask1)
    activity = Activity.new(name: "1234567891011121314151617181920", task: task, identifier: "abcdefg")
    assert !activity.valid?
    assert activity.errors[:name].any?
  end
end
