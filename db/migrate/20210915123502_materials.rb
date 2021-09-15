class Materials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :material_name #資材名
      t.boolean :order_status, default: false, null: false #発注ステータス
      t.date :order_date #発注日
      
      t.timestamps
    end
  end
end
