class Challenge < ApplicationRecord
  belongs_to :user
  has_many :participations

  validates :title, :place, :date, presence: true
end
