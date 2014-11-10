require 'test_helper'

class ZoneTest < ActiveSupport::TestCase

  test "name required" do
    zone = Zone.new()
    assert !zone.valid?
    assert zone.errors[:name].any?
  end

  test "correct name" do
    zone = zones(:beacon1)
    assert zone.valid?
  end

  test "harbor required" do
    zone = Zone.new()
    assert !zone.valid?
    assert zone.errors[:harbor].any?
  end



  test "task required" do
    zone = Zone.new()
    assert !zone.valid?
    assert zone.errors[:task].any?
  end

  test "technology out of range" do
    zone = zones(:beacon1)

    zone.technology = 4
    assert !zone.valid?

    zone.technology = -1
    assert !zone.valid?
  end

  test "technology must be number" do
    zone = zones(:beacon1)

    zone.technology = 2.4
    assert !zone.valid?
  end

  test "gps technology valid" do
    zone = zones(:beacon1)
    zone.technology = Technology.GPS
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "beacon technology valid" do
    zone = zones(:beacon1)
    zone.technology = Technology.BEACON
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "nfc technology valid" do
    zone = zones(:beacon1)
    zone.technology = Technology.NFC
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "qr technology valid" do
    zone = zones(:beacon1)
    zone.technology = Technology.QR
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "accuracy out of range" do
    zone = zones(:beacon1)

    zone.accuracy = 3
    assert !zone.valid?

    zone.accuracy = -1
    assert !zone.valid?
  end

  test "low accuracy valid" do
    zone = zones(:beacon1)
    zone.accuracy = Accuracy.LOW
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "medium accuracy valid" do
    zone = zones(:beacon1)
    zone.accuracy = Accuracy.MEDIUM
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "high accuracy valid" do
    zone = zones(:beacon1)
    zone.accuracy = Accuracy.HIGH
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "accuracy must be number" do
    zone = zones(:beacon1)

    zone.accuracy = 2.4
    assert !zone.valid?
  end

  test "lat required" do
    zone = Zone.new()
    assert !zone.valid?
    assert zone.errors[:lat].any?
  end

  test "lon required" do
    zone = Zone.new()
    assert !zone.valid?
    assert zone.errors[:lon].any?
  end

  test "lat long not higher than 180" do
    zone = zones(:beacon1)
    zone.lat = 181
    zone.lon = 181
    assert !zone.valid?
    assert zone.errors[:lat].any?
    assert zone.errors[:lon].any?
  end

  test "lat long not lower than -180" do
    zone = zones(:beacon1)
    zone.lat = -181
    zone.lon = -181
    assert !zone.valid?
    assert zone.errors[:lat].any?
    assert zone.errors[:lon].any?
  end

  test "major must be number" do
    zone = zones(:beacon1)

    zone.major = 2.4
    assert !zone.valid?
  end

  test "major must be present for beacon" do
    zone = zones(:beacon1)

    zone.major = nil
    assert !zone.valid?
    assert zone.errors[:major].any?
  end

  test "major not required for GPS" do
    zone = zones(:schmitten1)
    zone.major = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "major not required for NFC" do
    zone = zones(:nfc1)
    zone.major = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "major not required for QR" do
    zone = zones(:qr1)
    zone.major = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "minor must be number" do
    zone = zones(:beacon1)

    zone.minor = 2.4
    assert !zone.valid?
  end

  test "minor must be present for beacon" do
    zone = zones(:beacon1)

    zone.minor = nil
    assert !zone.valid?
    assert zone.errors[:minor].any?
  end

  test "minor not required for GPS" do
    zone = zones(:schmitten1)
    zone.minor = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "minor not required for NFC" do
    zone = zones(:nfc1)
    zone.minor = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "minor not required for QR" do
    zone = zones(:qr1)
    zone.minor = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "GPS needs no identifier" do
    zone = zones(:schmitten1)
    zone.identifier = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "BEACON needs identifier" do
    zone = zones(:beacon1)
    zone.identifier = nil
    assert !zone.valid?
    assert zone.errors[:identifier].any?
  end

  test "NFC needs identifier" do
    zone = zones(:beacon1)
    zone.technology = Technology.NFC
    zone.identifier = nil
    assert !zone.valid?
    assert zone.errors[:identifier].any?
  end

  test "QR needs identifier" do
    zone = zones(:beacon1)
    zone.technology = Technology.QR
    zone.identifier = nil
    assert !zone.valid?
    assert zone.errors[:identifier].any?
  end

  test "GPS needs no accuracy" do
    zone = zones(:schmitten1)
    zone.accuracy = nil
    assert !zone.valid?
    assert zone.errors[:accuracy].any?
  end

  test "BEACON needs accuracy" do
    zone = zones(:beacon1)
    zone.accuracy = nil
    assert !zone.valid?
    assert zone.errors[:accuracy].any?
  end

  test "NFC needs no accuracy" do
    zone = zones(:nfc1)
    zone.accuracy = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "QR needs no accuracy" do
    zone = zones(:qr1)
    zone.accuracy = nil
    assert zone.valid?, zone.errors.full_messages.inspect
  end

  test "should be linked list" do

=begin
    poi1 = zones(:schmitten1)
    poi2 = zones(:schmitten2)
    poi3 = zones(:schmitten3)

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
