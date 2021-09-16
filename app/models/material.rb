class Material < ApplicationRecord
  has_many :owners, through: :owner_materials
  has_many :owner_materials
end
