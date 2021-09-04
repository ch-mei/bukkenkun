class AddNameToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :name, :string #物件名
  end
end
