class Harbor < ActiveRecord::Base
  has_many :collections
  has_many :tasks
end
