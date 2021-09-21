class AddOwnerIdToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :owner_id, :integer
  end
end
