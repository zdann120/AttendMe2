class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :event, foreign_key: true, type: :uuid
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.boolean :approved, null: false, default: false
      t.boolean :checked_in, null: false, default: false

      t.timestamps
    end
  end
end
