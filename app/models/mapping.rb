class Mapping < ActiveRecord::Base
  has_one :in, class_name: "Port", foreign_key: "in_id"
  has_one :out, class_name: "Port", foreign_key: "out_id"

  validate :validate_port_types, :validate_port_activities

  private
    def validate_port_types
      true
    end

    def validate_port_activities
      true
    end

end
