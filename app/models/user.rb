class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    return admin
  end

  def regular?
    return role == nil
  end

  def student?
    return role == "Student"
  end

  def teacher?
    return role == "Teacher"
  end

  def has_dept?
    if role != "Student"
      return false
    end
    return  DeptStudent.where(user_id: id).count != 0
  end
end
