class Chat < ApplicationRecord

  include ActiveModel::Conversion

  belongs_to :user
  belongs_to :room

  validates :user_id, presence: true
  validates :room_id, presence: true
  validates :message, presence: true

  def persisted? ; false ; end
end
