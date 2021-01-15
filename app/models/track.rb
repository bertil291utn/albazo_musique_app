class Track < ApplicationRecord
  belongs_to :artist
  belongs_to :recorded_at, class_name: "Dpa", foreign_key: :dpa_id, optional: true
  validates :artist, presence: true
  has_many :credits_tracks, dependent: :destroy
end
