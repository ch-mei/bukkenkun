class ConstructionShop < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :sales_outlet
end
