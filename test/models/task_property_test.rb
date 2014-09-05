require 'test_helper'

class TaskPropertyTest < ActiveSupport::TestCase

  test "region required" do
    task_property = TaskProperty.new()
    assert !task_property.valid?
    assert task_property.errors[:region].any?
  end

  test "key required" do
    task_property = TaskProperty.new()
    assert !task_property.valid?
    assert task_property.errors[:key].any?
  end

  test "value required" do
    task_property = TaskProperty.new()
    assert !task_property.valid?
    assert task_property.errors[:value].any?
  end
end
