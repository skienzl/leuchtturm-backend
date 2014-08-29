class TaskProperty < ActiveRecord::Base
  belongs_to :task
  belongs_to :region

  validates :task, presence: true
  validates :region, presence: true
  validates :key, presence: true
  validates :value, presence: true

end
