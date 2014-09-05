class Setting < ActiveRecord::Base
  belongs_to :region

  validates :region, presence: true
  validates :key, presence: true
  validates :value, presence: true

end
