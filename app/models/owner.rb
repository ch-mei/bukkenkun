class Owner < ApplicationRecord
  has_many :quotations
  belongs_to :client

  has_many :owner_materials
  has_many :materials, through: :owner_materials
  accepts_nested_attributes_for :materials

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
end
