class ConstructionShops < ActiveRecord::Migration[5.2]
  def change
    create_table :construction_shops do |t|
      t.integer :client_id
      t.integer :sales_outlet_id, null: true
      t.string :construction_shop_name, null: true

      t.timestamps
    end
  end
end
