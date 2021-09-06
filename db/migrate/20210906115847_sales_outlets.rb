class SalesOutlets < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_outlets do |t|
      t.integer :client_id
      t.string :sales_outlet_name, null: true

      t.timestamps
    end
  end
end
