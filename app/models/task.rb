class Task < ActiveRecord::Base
  belongs_to :scope
  has_many :activities
  has_many :mappings
  has_many :zones

  validates :scope, presence: true
  validates :name, presence: true
  validates :name, length: { minimum: 5 }

end
