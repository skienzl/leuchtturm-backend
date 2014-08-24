class Harbor < ActiveRecord::Base
  has_many :collections
  has_many :tasks

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 5, maximum: 20 }

end
