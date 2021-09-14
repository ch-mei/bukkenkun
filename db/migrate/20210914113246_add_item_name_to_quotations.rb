class AddItemNameToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :item_name, :string
  end
end
