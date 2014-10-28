require 'test_helper'

class RegionTest < ActiveSupport::TestCase

  test "name required" do
    region = Region.new()
    assert !region.valid?
    assert region.errors[:name].any?
  end

  test "correct name" do
    region = regions(:beacon1)
    assert region.valid?
  end

  test "collection required" do
    region = Region.new()
    assert !region.valid?
    assert region.errors[:collection].any?
  end

  test "harbor required" do
    region = Region.new()
    assert !region.valid?
    assert region.errors[:harbor].any?
  end



  test "task required" do
    region = Region.new()
    assert !region.valid?
    assert region.errors[:task].any?
  end

  test "technology out of range" do
    region = regions(:beacon1)

    region.technology = 4
    assert !region.valid?

    region.technology = -1
    assert !region.valid?
  end

  test "technology must be number" do
    region = regions(:beacon1)

    region.technology = 2.4
    assert !region.valid?
  end

  test "gps technology valid" do
    region = regions(:beacon1)
    region.technology = Technology.GPS
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "beacon technology valid" do
    region = regions(:beacon1)
    region.technology = Technology.BEACON
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "nfc technology valid" do
    region = regions(:beacon1)
    region.technology = Technology.NFC
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "qr technology valid" do
    region = regions(:beacon1)
    region.technology = Technology.QR
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "accuracy out of range" do
    region = regions(:beacon1)

    region.accuracy = 3
    assert !region.valid?

    region.accuracy = -1
    assert !region.valid?
  end

  test "low accuracy valid" do
    region = regions(:beacon1)
    region.accuracy = Accuracy::LOW
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "medium accuracy valid" do
    region = regions(:beacon1)
    region.accuracy = Accuracy::MEDIUM
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "high accuracy valid" do
    region = regions(:beacon1)
    region.accuracy = Accuracy::HIGH
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "accuracy must be number" do
    region = regions(:beacon1)

    region.accuracy = 2.4
    assert !region.valid?
  end

  test "lat required" do
    region = Region.new()
    assert !region.valid?
    assert region.errors[:lat].any?
  end

  test "lon required" do
    region = Region.new()
    assert !region.valid?
    assert region.errors[:lon].any?
  end

  test "lat long not higher than 180" do
    region = regions(:beacon1)
    region.lat = 181
    region.lon = 181
    assert !region.valid?
    assert region.errors[:lat].any?
    assert region.errors[:lon].any?
  end

  test "lat long not lower than -180" do
    region = regions(:beacon1)
    region.lat = -181
    region.lon = -181
    assert !region.valid?
    assert region.errors[:lat].any?
    assert region.errors[:lon].any?
  end

  test "major must be number" do
    region = regions(:beacon1)

    region.major = 2.4
    assert !region.valid?
  end

  test "major must be present for beacon" do
    region = regions(:beacon1)

    region.major = nil
    assert !region.valid?
    assert region.errors[:major].any?
  end

  test "major not required for GPS" do
    region = regions(:schmitten1)
    region.major = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "major not required for NFC" do
    region = regions(:nfc1)
    region.major = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "major not required for QR" do
    region = regions(:qr1)
    region.major = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "minor must be number" do
    region = regions(:beacon1)

    region.minor = 2.4
    assert !region.valid?
  end

  test "minor must be present for beacon" do
    region = regions(:beacon1)

    region.minor = nil
    assert !region.valid?
    assert region.errors[:minor].any?
  end

  test "minor not required for GPS" do
    region = regions(:schmitten1)
    region.minor = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "minor not required for NFC" do
    region = regions(:nfc1)
    region.minor = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "minor not required for QR" do
    region = regions(:qr1)
    region.minor = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "GPS needs no identifier" do
    region = regions(:schmitten1)
    region.identifier = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "BEACON needs identifier" do
    region = regions(:beacon1)
    region.identifier = nil
    assert !region.valid?
    assert region.errors[:identifier].any?
  end

  test "NFC needs identifier" do
    region = regions(:beacon1)
    region.technology = Technology.NFC
    region.identifier = nil
    assert !region.valid?
    assert region.errors[:identifier].any?
  end

  test "QR needs identifier" do
    region = regions(:beacon1)
    region.technology = Technology.QR
    region.identifier = nil
    assert !region.valid?
    assert region.errors[:identifier].any?
  end

  test "GPS needs no accuracy" do
    region = regions(:schmitten1)
    region.accuracy = nil
    assert !region.valid?
    assert region.errors[:accuracy].any?
  end

  test "BEACON needs accuracy" do
    region = regions(:beacon1)
    region.accuracy = nil
    assert !region.valid?
    assert region.errors[:accuracy].any?
  end

  test "NFC needs no accuracy" do
    region = regions(:nfc1)
    region.accuracy = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "QR needs no accuracy" do
    region = regions(:qr1)
    region.accuracy = nil
    assert region.valid?, region.errors.full_messages.inspect
  end

  test "should be linked list" do

=begin
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
=end
  end

  test "should fail with broken list" do
    #assert false
  end

end
