class AddApprovedToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :approved, :boolean
  end
end
