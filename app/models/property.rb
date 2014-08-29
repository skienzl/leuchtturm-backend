class Property < ActiveRecord::Base
  belongs_to :activity

  validates :activity, presence: true
  validates :key, presence: true
  validates :key, uniqueness: true
  validates :key, length: { :in => 5..20 }

end
