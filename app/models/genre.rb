class Genre < ApplicationRecord
  has_many :artist_genres
  has_many :artists, through: :artist_genres

  scope :includes_artists, -> { includes(:artists) }
  scope :find_genres_from_array, ->(array_genres) { includes_artists.find(array_genres) }
  scope :display_artists, ->(array_genres) { find_genres_from_array(array_genres).map(&:artists) }

  scope :ordered, -> { order(name: :asc) }
end
