class Client < ApplicationRecord

    has_many :owners
    has_many :sales_outlets
    has_many :construction_shops
    belongs_to :user
end
