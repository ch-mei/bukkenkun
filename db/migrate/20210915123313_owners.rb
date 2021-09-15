class Owners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.integer :client_id
      t.integer :material_id
      t.text :comment, null: true #コメント
      t.string :name #物件名

      t.timestamps
    end
  end
end
