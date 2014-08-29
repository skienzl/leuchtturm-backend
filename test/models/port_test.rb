require 'test_helper'

class PortTest < ActiveSupport::TestCase
  test "datatype can be string" do
    port = ports(:one)
    port.data_type = DataType::STRING
    assert port.valid?
  end

  test "datatype can be integer" do
    port = ports(:one)
    port.data_type = DataType::INTEGER
    assert port.valid?
  end

  test "datatype out of scope" do
    port = ports(:one)
    port.data_type = -1
    assert !port.valid?
    assert port.errors[:data_type].any?

    port.data_type = 2
    assert !port.valid?
    assert port.errors[:data_type].any?
  end

  test "port type can be in" do
    port = ports(:one)
    port.port_type = PortType::IN
    assert port.valid?
  end

  test "port type can be out" do
    port = ports(:one)
    port.port_type = PortType::OUT
    assert port.valid?
  end

  test "port type can be proxy" do
    port = ports(:one)
    port.port_type = PortType::PROXY
    assert port.valid?
  end

  test "port type out of scope" do
    port = ports(:one)
    port.port_type = -1
    assert !port.valid?
    assert port.errors[:port_type].any?

    port.port_type = 3
    assert !port.valid?
    assert port.errors[:port_type].any?
  end

end
