class Setting < ActiveRecord::Base
  belongs_to :zone
  belongs_to :activity

  validates :zone, presence: true
  validates :activity, presence: true
  validates :key, presence: true
  validates :value, presence: true

end
