class Artist < ApplicationRecord
  belongs_to :location, class_name: "Dpa", foreign_key: :dpa_id, optional: true
  has_many :artist_genres, dependent: :destroy
  has_many :genres, through: :artist_genres
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks
  # accepts_nested_attributes_for :artist_genres
  has_many :artist_networks, dependent: :destroy
  has_many :networks, through: :artist_networks
  has_many :credits_tracks, dependent: :destroy

  def genre_list
    genres
  end

  def genre_list=(genre_list)
    var_genre_list = genre_list.reject(&:empty?).empty?
    return if var_genre_list.empty?

    self.genres = var_genre_list.collect do |elem|
      Genre.find_or_create_by(id: elem.to_i)
    end
  end
end
