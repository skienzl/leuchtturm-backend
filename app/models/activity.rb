class Activity < ActiveRecord::Base
  belongs_to :task
  has_many :ports
  has_many :properties
end
