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
end
