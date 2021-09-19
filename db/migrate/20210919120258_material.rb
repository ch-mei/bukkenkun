class Material < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :material_name
      
      t.timestamps
    end
  end
end
