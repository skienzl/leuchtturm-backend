class Task < ActiveRecord::Base
  belongs_to :region
  has_many :activities
end
