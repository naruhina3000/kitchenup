class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  
  has_many :kitchens, dependent: :destroy
  has_many :bookings
  has_many :favorites
  has_many :reviews

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true
end
