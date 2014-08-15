require 'test_helper'

class CollectionTest < ActiveSupport::TestCase

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
