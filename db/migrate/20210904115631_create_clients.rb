class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.integer :user_id
      t.string :sales_outlet, null: true #販売店
      t.string :construction_shop, null: true #工務店

      t.timestamps
    end
  end
end
