class Semester < ApplicationRecord
  belongs_to :year

  def number_of_subjects
    res = SemesterSubject.where(semester_id: id)
    if res == nil
      return 0
    end
    return res.count
  end

  def current_subjects
    return  Subject.select(:id, :title).where(id: SemesterSubject.select(:subject_id).where(semester_id: id))
  end
end
