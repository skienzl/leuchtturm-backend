class Collection < ActiveRecord::Base
  belongs_to :harbor
  has_many :regions

  def check_list_consistency
    true
  end

  def head

  end

  def tail
  end

end
