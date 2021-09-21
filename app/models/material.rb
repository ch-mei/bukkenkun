class Material < ApplicationRecord
  belongs_to :owner, inverse_of: :materials
end
