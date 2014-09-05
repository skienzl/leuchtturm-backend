class Property < ActiveRecord::Base
  belongs_to :activity

  validates :activity, presence: true
  validates :key, presence: true
  validates :key, uniqueness: true
  validates :key, length: {  minimum: 5 }

end
