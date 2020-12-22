class Artist < ApplicationRecord
  has_one :dpa
  has_many :artist_genres
  has_many :genres, through: :artist_genres
end
