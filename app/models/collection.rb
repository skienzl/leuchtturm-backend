class Collection < ActiveRecord::Base
  belongs_to :harbor
  has_many :regions

  validates :harbor, presence: true

  validates :name, presence: true
  validates :name, length: { minimum: 5, maximum: 20 }

  def check_list_consistency
    true
  end

  def head

  end

  def tail
  end

end
