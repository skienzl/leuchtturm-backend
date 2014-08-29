class Activity < ActiveRecord::Base
  belongs_to :task
  has_many :ports
  has_many :properties

  validates :task, presence: true
  validates :identifier, presence: true
  validates :name, presence: true
  validates :name, length: { :in => 5..20 }

end
