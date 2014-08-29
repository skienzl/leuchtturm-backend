require 'test_helper'

class MappingTest < ActiveSupport::TestCase
  test "task required" do
    mapping = Mapping.new()
    assert !mapping.valid?
    assert mapping.errors[:task].any?
  end

  test "in required if out missing" do
    mapping = Mapping.new()
    assert !mapping.valid?
    assert mapping.errors[:out].any?
    assert mapping.errors[:in].any?
  end

  test "out can be nil if in is set" do
    task = tasks(:task_beacontask1)
    port = ports(:one)
    port.port_type = PortType::IN
    mapping = Mapping.new(task: task, in: port)
    assert mapping.valid?, mapping.errors.full_messages
  end

  test "out required if in missing" do
    mapping = Mapping.new()
    assert !mapping.valid?
    assert mapping.errors[:in].any?
    assert mapping.errors[:out].any?
  end

  test "in can be nil if out is set" do
    task = tasks(:task_beacontask1)
    port = ports(:one)
    port.port_type = PortType::OUT
    mapping = Mapping.new(task: task, out: port)
    assert mapping.valid?
  end

  test "in and out data types must match" do
    task = tasks(:task_beacontask1)
    in_port = ports(:one)
    in_port.port_type = PortType::IN
    in_port.data_type = DataType::STRING
    out_port = ports(:two)
    in_port.port_type = PortType::OUT
    out_port.data_type = DataType::INTEGER

    mapping = Mapping.new(task: task, in: in_port, out: out_port)

    assert !mapping.valid?, mapping.errors.full_messages
    assert mapping.errors.full_messages.include?('In and out port data types must match')
  end

  test "in and out data types match" do
    task = tasks(:task_beacontask1)
    in_port = ports(:one)
    in_port.port_type = PortType::IN
    in_port.data_type = DataType::STRING
    out_port = ports(:two)
    out_port.port_type = PortType::OUT
    out_port.data_type = DataType::STRING

    mapping = Mapping.new(task: task, in: in_port, out: out_port)

    assert mapping.valid?, mapping.errors.full_messages
  end

  test "in port type must match" do
    task = tasks(:task_beacontask1)
    port = ports(:one)
    port.port_type = PortType::OUT
    mapping = Mapping.new(task: task, in: port)
    assert !mapping.valid?, mapping.errors.full_messages
    assert mapping.errors.full_messages.include?('In has an incorrect port type')
  end

  test "out port type must match" do
    task = tasks(:task_beacontask1)
    port = ports(:one)
    port.port_type = PortType::IN
    mapping = Mapping.new(task: task, out: port)
    assert !mapping.valid?, mapping.errors.full_messages
    assert mapping.errors.full_messages.include?('Out has an incorrect port type')
  end

  test "in port type can be proxy" do
    task = tasks(:task_beacontask1)
    port = ports(:one)
    port.port_type = PortType::PROXY
    mapping = Mapping.new(task: task, in: port)
    assert mapping.valid?, mapping.errors.full_messages
  end

  test "out port type can be proxy" do
    task = tasks(:task_beacontask1)
    port = ports(:one)
    port.port_type = PortType::PROXY
    mapping = Mapping.new(task: task, out: port)
    assert mapping.valid?, mapping.errors.full_messages
  end

end
