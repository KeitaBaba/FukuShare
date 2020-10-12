class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :fukus
  has_many :likes
  
  validates :name, presence: true
  validates :email, presence: true
  validates :profile_image_id, presence: true
end
