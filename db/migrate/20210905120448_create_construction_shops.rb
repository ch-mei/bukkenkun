class CreateConstructionShops < ActiveRecord::Migration[5.2]
  def change
    create_table :construction_shops do |t|
      t.integer :client_id
      t.integer :sales_outlet_id
      t.string :construction_shop_name

      t.timestamps
    end
  end
end
