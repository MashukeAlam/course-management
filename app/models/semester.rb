class Semester < ApplicationRecord
  belongs_to :year

  def number_of_subjects
    res = SemesterSubject.where(semester_id: id)
    if res == nil
      return 0
    end
    return res.count
  end
end
