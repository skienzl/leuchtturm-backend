require 'test_helper'

class ScopeTest < ActiveSupport::TestCase

  test "correct name" do
    scope = Scope.new(name: "Scope 1")
    assert scope.valid?
  end

  test "name required" do
    scope = Scope.new()
    assert !scope.valid?
    assert scope.errors[:name].any?
  end

  test "name needs to be unique" do
    scope = Scope.new(name: "Scope 1")
    assert scope.valid?
    scope.save
    scope = Scope.new(name: "Scope 1")
    assert !scope.valid?
    assert scope.errors[:name].any?
  end

  test "name length needs to be greater than 5" do
    scope = Scope.new(name: "yxz")
    assert !scope.valid?
    assert scope.errors[:name].any?
  end

end
