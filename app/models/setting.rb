class Setting < ActiveRecord::Base
  belongs_to :zone

  validates :zone, presence: true
  validates :key, presence: true
  validates :value, presence: true

end
