class SalesOutlet < ApplicationRecord
  belongs_to :client
  has_many :construction_shops
end
