require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

  test "correct name" do
    zell = harbors(:zell)
    collection = Collection.new(harbor: zell, name: "Collection 1")
    assert collection.valid?
  end

  test "name required" do
    collection = Collection.new()
    assert !collection.valid?
    assert collection.errors[:name].any?
  end

  test "harbor required" do
    collection = Collection.new()
    assert !collection.valid?
    assert collection.errors[:harbor].any?
  end

  test "name length needs to be greater than 5" do
    collection = Collection.new(name: "yxz")
    assert !collection.valid?
    assert collection.errors[:name].any?
  end

  test "name length needs to be smaller than 20" do
    collection = Collection.new(name: "1234567891011121314151617181920")
    assert !collection.valid?
    assert collection.errors[:name].any?
  end

  test "should have harbor" do
    zell = harbors(:zell)
    schmitten = collections(:schmitten)
    assert schmitten.harbor == zell
  end

  test "should have regions" do
    schmitten = collections(:schmitten)
    assert schmitten.regions.length == 3
  end

  test "should fail with broken list" do
    #assert false
  end

end
