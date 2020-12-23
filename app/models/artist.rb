class Artist < ApplicationRecord
  belongs_to :dpa
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  has_many :tracks
end
