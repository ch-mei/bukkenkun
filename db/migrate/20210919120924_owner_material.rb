class OwnerMaterial < ActiveRecord::Migration[5.2]
  def change
     create_table :owner_materials do |t|
      t.integer :owner_id
      t.integer :material_id
      t.boolean :order_status, default: false, null: false
      t.date :order_date

      t.timestamps
    end
  end
end
