class AddAccessKeyToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :access_key, :string
    add_index :registrations, :access_key, unique: true
  end
end
