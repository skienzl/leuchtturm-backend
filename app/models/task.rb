class Task < ActiveRecord::Base
  belongs_to :harbor
  has_many :activities
  has_many :mappings
  has_many :regions

end
