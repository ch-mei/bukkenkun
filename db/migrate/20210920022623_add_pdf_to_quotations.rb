class AddPdfToQuotations < ActiveRecord::Migration[5.2]
  def change
    add_column :quotations, :pdf, :string
  end
end
