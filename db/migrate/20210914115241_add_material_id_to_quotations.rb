class AddMaterialIdToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :material_id, :integer
  end
end
