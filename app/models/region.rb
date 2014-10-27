
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
  belongs_to :previous, class_name: 'Region', foreign_key: 'next_id'
  has_one :next, class_name: 'Region', foreign_key: 'prev_id'
  has_many :settings
  belongs_to :task
  belongs_to :harbor

  validates :harbor, presence: true

  validates :name, presence: true

  validates :collection, presence: true

  validates :task, presence: true

  validates :technology, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 3,
  }

  validates :accuracy, numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 2,
  }, unless: 'accuracy.nil?'
  validates :accuracy, presence: true, if: :needs_accuracy?

  validates :lat, presence: true
  validates :lat, numericality: {
      greater_than_or_equal_to: -180,
      less_than_or_equal_to: 180,
  }

  validates :lon, presence: true
  validates :lon, numericality: {
      greater_than_or_equal_to: -180,
      less_than_or_equal_to: 180,
  }

  validates :major, numericality: {
      only_integer: true
  }, unless: 'major.nil?'
  validates :major, presence: true, if: :is_beacon?

  validates :minor, numericality: {
      only_integer: true
  }, unless: 'major.nil?'
  validates :minor, presence: true, if: :is_beacon?

  validates :identifier, presence: true, if: :needs_identifier?

  validate :list_consistency_check

  private

    # VALIDATION HELPER
    def list_consistency_check
      collection.nil? || collection.check_list_consistency
    end

    def is_beacon?
      return technology == Technology::BEACON
    end

    def needs_identifier?
      return technology != Technology::GPS
    end

  def needs_accuracy?
    return [Technology::GPS, Technology::BEACON].include? technology
  end
end
