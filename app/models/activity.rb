class Activity < ActiveRecord::Base
  belongs_to :task
  has_many :ports
  has_many :properties
  has_many :settings

  validates :task, presence: true
  validates :identifier, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 5 }

end
