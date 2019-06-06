class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :challenges
  has_many :participations
  has_many :participated_challenges, through: :participations, source: :challenge
  # validates :first_name, :last_name, presence: true

  def score_to_percentage
    maxed_score = [score, 1000].min
    (maxed_score * 100) / 1000
  end
end
