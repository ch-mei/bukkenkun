class SalesOutlet < ApplicationRecord
  belongs_to :client_id
  has_many :construction_shops
end
