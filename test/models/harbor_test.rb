require 'test_helper'

class HarborTest < ActiveSupport::TestCase

  test "correct name" do
    harbor = Harbor.new(name: "Harbor 1")
    assert harbor.valid?
  end

  test "name required" do
    harbor = Harbor.new()
    assert !harbor.valid?
    assert harbor.errors[:name].any?
  end

  test "name needs to be unique" do
    harbor = Harbor.new(name: "Harbor 1")
    assert harbor.valid?
    harbor.save
    harbor = Harbor.new(name: "Harbor 1")
    assert !harbor.valid?
    assert harbor.errors[:name].any?
  end

  test "name length needs to be greater than 5" do
    harbor = Harbor.new(name: "yxz")
    assert !harbor.valid?
    assert harbor.errors[:name].any?
  end

end
