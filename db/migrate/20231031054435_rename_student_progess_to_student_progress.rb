class RenameStudentProgessToStudentProgress < ActiveRecord::Migration[6.1]
  def change
    rename_table :student_progesses, :student_progresses
  end
end
