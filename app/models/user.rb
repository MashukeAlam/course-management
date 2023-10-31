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

  def dept_name
    if role != "Student"
      return "What?"
    end
    return Department.find(DeptStudent.select(:department_id).where(user_id: id).first.department_id).title

  end

  def year_sem
    if role != "Student"
      return "What?"
    end

    res = []
    year = StudentProgress.find_by_student_id(id)
  end
end
