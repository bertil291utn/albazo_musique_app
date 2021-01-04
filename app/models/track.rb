class Track < ApplicationRecord
  belongs_to :artist
  validates :artist, presence: true
  has_many :credits_tracks, dependent: :destroy
end
