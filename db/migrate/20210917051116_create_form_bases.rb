class CreateFormBases < ActiveRecord::Migration[5.2]
  def change
    create_table :form_bases do |t|

      t.timestamps
    end
  end
end
