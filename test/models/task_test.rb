require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "should have region" do
    task = tasks(:task_beacontask1)
    assert task.regions.length == 1, "Should have region"
  end

  test "should have harbor" do
    task = tasks(:task_beacontask1)
    assert task.harbor.name == "Rettungsboot", "Should have harbor 'Rettungsboot'"
  end
end
