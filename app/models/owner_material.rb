class OwnerMaterial < ApplicationRecord
  belongs_to :owner
  belongs_to :material
end
