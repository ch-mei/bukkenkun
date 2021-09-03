class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.integer :client_id
      t.text :comment, null: true
      t.date :order_date, null: true
      t.boolean :order_status, default: false, null: false
      

      t.timestamps
    end
  end
end
