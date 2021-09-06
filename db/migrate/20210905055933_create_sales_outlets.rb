class CreateSalesOutlets < ActiveRecord::Migration[5.2]
  def change
    create_table :sales_outlets do |t|
      t.integer :client_id
      t.string :sales_outlet_name 

      t.timestamps
    end
  end
end
