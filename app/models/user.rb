module UserRole
  USER      = 0
  ADMIN     = 1
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         #:registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  def isAdmin
    return self.role == UserRole::ADMIN
  end

end
