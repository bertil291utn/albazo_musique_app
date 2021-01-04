class Track < ApplicationRecord
  belongs_to :artist
  belongs_to :dpa
  validates :artist, presence: true
  has_many :credits_tracks, dependent: :destroy
end
