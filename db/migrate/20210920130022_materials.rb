class Materials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :material_name
      t.boolean :order_status, default: false, null: false
      t.date :order_date

      t.timestamps
    end
  end
end
