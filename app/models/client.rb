class Client < ApplicationRecord

    has_many :owners
    #has_many :sales_outlets
    #has_many :construction_shops
    belongs_to :user, optional: true

    def self.search(keyword)
        where(["name like?", "%#{keyword}%"])
    end
end
