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
end
