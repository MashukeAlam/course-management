class Subject < ApplicationRecord
  STATUS_LIST = [['Mandatory', 'Mandatory'],
                 ['Optional', 'Optional']
  ]

  def if_teacher_exist
    res = TeacherSubject.where(subject_id: id)
    if res.count > 0
      return true
    end
    return false
  end

  def which_teacher
    return TeacherSubject.where(subject_id: id)[0].user.email
  end
end
