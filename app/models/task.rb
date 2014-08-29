class Task < ActiveRecord::Base
  belongs_to :harbor
  has_many :activities
  has_many :mappings
  has_many :regions

  validates :harbor, presence: true

  validates :name, presence: true

  validates :name, length: { :in => 5..20 }

end
