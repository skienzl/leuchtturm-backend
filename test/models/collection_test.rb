require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

  test "correct name" do
    collection = Collection.new(name: "Collection 1")
    assert collection.valid?
  end

  test "name required" do
    collection = Collection.new()
    assert !collection.valid?
    assert collection.errors[:name].any?
  end


  test "name length needs to be greater than 5" do
    collection = Collection.new(name: "yxz")
    assert !collection.valid?
    assert collection.errors[:name].any?
  end

  test "should have zones" do
    schmitten = collections(:schmitten)
    assert schmitten.zones.length == 3
  end

  test "should fail with broken list" do
    #assert false
  end

end
