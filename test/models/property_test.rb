require 'test_helper'

class PropertyTest < ActiveSupport::TestCase

  test "activity required" do
    property = Property.new()
    assert !property.valid?
    assert property.errors[:activity].any?
  end

  test "correct key" do
    activity = activities(:one)
    property = Property.new(key: "Property 1", activity: activity)
    assert property.valid?
  end

  test "key required" do
    property = Property.new()
    assert !property.valid?
    assert property.errors[:key].any?
  end

  test "key needs to be unique" do
    activity = activities(:one)
    property = Property.new(key: "Property 1", activity: activity)
    assert property.valid?
    property.save
    property = Property.new(key: "Property 1", activity: activity)
    assert !property.valid?
    assert property.errors[:key].any?
  end

  test "key length needs to be greater than 5" do
    activity = activities(:one)
    property = Property.new(key: "yxz", activity: activity)
    assert !property.valid?
    assert property.errors[:key].any?
  end

end
