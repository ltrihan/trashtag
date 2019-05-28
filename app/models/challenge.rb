class Challenge < ApplicationRecord
  belongs_to :user
  has_many :participations

  has_many :users, through: :participations

  # validates :title, :place, :date, presence: true
end
