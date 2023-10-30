class AddNameToYear < ActiveRecord::Migration[6.1]
  def change
    add_column :years, :name, :string
  end
end
