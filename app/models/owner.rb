class Owner < ApplicationRecord
  has_many :quotations
  belongs_to :client
  
end
