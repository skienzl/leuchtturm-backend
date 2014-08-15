
module Technology
  GPS = 0
  BEACON = 1
  NFC = 2
  QR = 3
end

module Accuracy
  HIGH = 2
  MEDIUM = 1
  LOW = 0
end

class Region < ActiveRecord::Base
  belongs_to :collection
  belongs_to :previous, class_name: "Region", foreign_key: "next_id"
  has_one :next, class_name: "Region", foreign_key: "prev_id"
  has_many :task_properties
  belongs_to :task

  validate :list_consistency_check

  private
    def list_consistency_check
      self.collection.check_list_consistency
    end
end
