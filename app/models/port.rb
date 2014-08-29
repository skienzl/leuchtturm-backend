module DataType
  STRING = 0
  INTEGER = 1
end

module PortType
  IN = 0
  OUT = 1
  PROXY = 2
end

class Port < ActiveRecord::Base
  belongs_to :activity
  belongs_to :in_mapping, class_name: "Mapping", foreign_key: "out_id"
  belongs_to :out_mapping, class_name: "Mapping", foreign_key: "in_id"

  validates :data_type, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 1,
  }

  validates :port_type, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 2,
  }
end
