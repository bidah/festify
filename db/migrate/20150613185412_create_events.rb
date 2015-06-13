class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :ticket_link
      t.integer :admin_id

      t.timestamps null: false
    end
  end
end
