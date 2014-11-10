require 'test_helper'

class SettingTest < ActiveSupport::TestCase

  test "zone required" do
    task_property = Setting.new()
    assert !task_property.valid?
    assert task_property.errors[:zone].any?
  end

  test "key required" do
    task_property = Setting.new()
    assert !task_property.valid?
    assert task_property.errors[:key].any?
  end

  test "value required" do
    task_property = Setting.new()
    assert !task_property.valid?
    assert task_property.errors[:value].any?
  end
end
