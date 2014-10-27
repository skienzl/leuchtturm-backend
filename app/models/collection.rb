class Collection < ActiveRecord::Base
  has_many :regions



  validates :name, presence: true
  validates :name, length: { minimum: 5 }

  def check_list_consistency
    true
  end

  def head

  end

  def tail

  end

end
