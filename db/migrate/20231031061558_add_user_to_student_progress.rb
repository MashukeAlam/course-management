class AddUserToStudentProgress < ActiveRecord::Migration[6.1]
  def change
    add_reference :student_progresses, :user, null: false, foreign_key: true
  end
end
