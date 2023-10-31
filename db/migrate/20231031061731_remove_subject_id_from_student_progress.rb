class RemoveSubjectIdFromStudentProgress < ActiveRecord::Migration[6.1]
  def change
    remove_reference :student_progresses, :subject, null: false, foreign_key: true
  end
end
