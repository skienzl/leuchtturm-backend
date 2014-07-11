require 'test_helper'

class RegionTest < ActiveSupport::TestCase

  test "should be linked list" do

    poi1 = regions(:schmitten1)
    poi2 = regions(:schmitten2)
    poi3 = regions(:schmitten3)

    poi1.next = poi2
    poi2.next = poi3
    poi2.previous = poi1
    poi3.previous = poi2

    assert poi1.previous.nil?, "Previous should be nil"
    assert poi1.next == poi2, "Next should be poi2"

    assert poi2.previous == poi1, "Previous should be poi1"
    assert poi2.next == poi3, "Next should be poi3"

    assert poi3.previous == poi2, "Previous should be poi2"
    assert poi3.next.nil?, "Next should be nil"
  end

  test "should fail with broken list" do
    assert false
  end
end
