class Challenge < ApplicationRecord
  attr_accessor :str_date

  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :date, presence: true

  # validates :title, :place, :date, presence: true

  enum status: { ongoing: 0, finished: 1 }

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_after, PhotoUploader

  validates :photo, presence: true
  # validates :photo_after, presence: true

  geocoded_by :place
  after_validation :geocode

  def format_date
    date.strftime(" %A %e %B %Y - %l:%M")
  end
end
