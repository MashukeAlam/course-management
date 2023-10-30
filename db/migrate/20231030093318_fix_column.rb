class FixColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :subjects, :type, :sub_type
  end
end
