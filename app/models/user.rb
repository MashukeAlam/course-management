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
    subject_list =  StudentSubject.select(:subject_id).where(user_id: id)
    return subject_list
  end

  def teacher_taking_which_subjects
    if role != "Teacher"
      return "What?"
    end

    return TeacherSubject.where(user_id: id)
  end

  def teacher_list
    return User.where(role: "Teacher")
  end

  def select_tag_list_for_teacher
    select_tag_appropiate_array = []
    teacher_list.each do |teacher|
      select_tag_appropiate_array.append(["#{teacher.email}", teacher.id])
    end

    return select_tag_appropiate_array
  end

  def students_taking_this_subject(sub_id)
    if role != "Teacher"
      "What?"
    end

    return StudentSubject.select(:user_id).where(subject_id: sub_id)

  end
end
