class User < ApplicationRecord

  include ActiveModel::Conversion

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :quotations
  has_many :clients
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def active_for_authentication?
    super && self.is_deleted?
  end

  def inactive_message
    self.is_deleted? ? super : :special_condition_is_not_valid
  end

end
