class Mapping < ActiveRecord::Base
  has_one :in, class_name: 'Port', foreign_key: 'id'
  has_one :out, class_name: 'Port', foreign_key: 'id'
  belongs_to :task

  validates :task, presence: true
  validates :in, presence: true, if: 'self.out.nil?'
  validates :out, presence: true, if: 'self.in.nil?'

  validate :validate_port_types, :validate_port_data_types

  private

    # VALIDATION HELPERS

    def validate_port_data_types
      if !self.in.nil? && !self.out.nil?
        if self.in.data_type != self.out.data_type
          errors.add(:base, 'In and out port data types must match')
        end
      end
    end

    def validate_port_types
      if !self.in.nil? && ![PortType::IN, PortType::PROXY].include?(self.in.port_type)
        errors.add(:in, 'has an incorrect port type')
      end

      if !self.out.nil? && ![PortType::OUT, PortType::PROXY].include?(self.out.port_type)
        errors.add(:out, 'has an incorrect port type')
      end
    end

end
