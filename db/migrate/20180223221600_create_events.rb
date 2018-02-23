class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.string :title, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.text :description
      t.string :location
      t.string :contact_email
      t.datetime :registration_starts_at, null: false
      t.datetime :registration_ends_at
      t.integer :price_cents
      t.boolean :registration_requires_approval, null: false, default: true

      t.timestamps
    end
    add_index :events, :title, unique: true
  end
end
