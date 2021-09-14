class ConstructionShop < ApplicationRecord
  #belongs_to :client
  belongs_to :sales_outlet, optional: true
end
