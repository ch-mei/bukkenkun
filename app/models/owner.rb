class Owner < ApplicationRecord
  has_many :quotations
  belongs_to :client
  has_many :materials, through: :owner_materials
  has_many :owner_materials
end
