class CreateDeptStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :dept_students do |t|
      t.references :department, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
