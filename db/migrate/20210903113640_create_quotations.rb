class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.integer :owner_id
      t.integer :user_id
      t.text :comment, null: true #コメント
      t.string :manufacturer_name, null: true #メーカー名

      t.timestamps
    end
  end
end
