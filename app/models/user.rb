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

  def is_admin?
    return self.role == UserRole::ADMIN
  end

  def role_name
    return is_admin? ? "Admin" : "User"
  end

end
