class AddPassedToStudentsubject < ActiveRecord::Migration[6.1]
  def change
    add_column :student_subjects, :passed, :boolean
  end
end
