class Harbor < ActiveRecord::Base
  has_many :collections
  has_many :tasks

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { :in => 5..20 }

end
