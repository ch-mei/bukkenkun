class Quotation < ApplicationRecord
  belongs_to :owner
  belongs_to :user
  
  mount_uploader :pdf, AvatarUploader
  #has_many_attached :pdfs

end
