class CreateFormMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :form_materials do |t|

      t.timestamps
    end
  end
end
