class Challenge < ApplicationRecord
  belongs_to :user
  has_many :participations

  has_many :users, through: :participations

  geocoded_by :place
  after_validation :geocode
  # validates :title, :place, :date, presence: true
end
