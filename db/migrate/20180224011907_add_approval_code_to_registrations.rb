class AddApprovalCodeToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :approval_code, :string
  end
end
