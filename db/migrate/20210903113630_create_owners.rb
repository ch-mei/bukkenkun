class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.integer :client_id
      t.text :comment, null: true #コメント
      t.date :order_date, null: true #発注日
      t.boolean :order_status, default: false, null: false #発注ステータス


      t.timestamps
    end
  end
end
