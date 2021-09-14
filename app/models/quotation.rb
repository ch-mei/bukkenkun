class Quotation < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  belongs_to :materia

end
