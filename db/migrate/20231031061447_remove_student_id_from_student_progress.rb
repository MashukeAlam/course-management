class RemoveStudentIdFromStudentProgress < ActiveRecord::Migration[6.1]
  def change
    remove_reference :student_progresses, :student, null: false, foreign_key: true
  end
end
