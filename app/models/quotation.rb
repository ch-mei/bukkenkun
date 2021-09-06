class Quotation < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  has_many :materials
  
end
