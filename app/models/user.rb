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
    year = StudentProgress.find_by_user_id(id).year.name
    semester = StudentProgress.find_by_user_id(id).semester.title

    return "You are in #{semester} of #{year}"
  end

  def subjects_taken
    if role != "Student"
      return "What?"
    end
    subject_list = SemesterSubject.where(semester_id: (StudentProgress.find_by_user_id(2).semester_id))
    return subject_list
  end
end
