class Owner < ApplicationRecord
  has_many :quotations
  belongs_to :client

  has_many :materials, dependent: :destroy, inverse_of: :owner
  accepts_nested_attributes_for :materials, allow_destroy: true #ビューからデータを送る際にownerと一緒にmaterialを送る

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
end
