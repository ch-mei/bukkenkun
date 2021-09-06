class SalesOutlet < ApplicationRecord
  belongs_to :client, optional: true
  has_many :construction_shops
end
