class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :kitchens, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :user_name, presence: true, uniqueness: true
  validates :first_name, presence: true

  def has_favorite?(kitchen)
    # self.favorites.pluck(:kitchen_id).include? kitchen.id
    Favorite.find_by(user: self, kitchen: kitchen)
  end
end
