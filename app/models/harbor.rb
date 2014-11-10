class Harbor < ActiveRecord::Base
  has_many :zones
  has_many :tasks

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 5 }

end
