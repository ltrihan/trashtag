class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :challenges
  has_many :participations
  has_many :participated_challenges, through: :participations, source: :challenge

  # validates :first_name, :last_name, presence: true
end
