class TaskProperty < ActiveRecord::Base
  belongs_to :task
  belongs_to :region
end
