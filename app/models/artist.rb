class Artist < ApplicationRecord
  belongs_to :dpa
  has_many :artist_genres, dependent: :destroy
  has_many :genres, through: :artist_genres
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks
  has_many :artist_networks, dependent: :destroy
  has_many :networks, through: :artist_networks
  has_many :credits_tracks, dependent: :destroy
end
