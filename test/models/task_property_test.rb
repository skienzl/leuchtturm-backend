require 'test_helper'

class TaskPropertyTest < ActiveSupport::TestCase
  test "should have task" do
    property = task_properties(:region_task1)
    assert property.task.name == "Beacon Task 1", "Should have task 'Beacon Task 1'"
  end

  test "should have region" do
    property = task_properties(:region_task1)
    assert property.region.name == "Beacon 1", "Should have region 'Beacon 1'"
  end
end
