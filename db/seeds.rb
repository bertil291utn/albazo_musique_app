# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

ArtistGenre.delete_all
Track.delete_all
Artist.delete_all
Dpa.delete_all
Genre.delete_all

dpa1 = Dpa.create! description: "pichincha", hierarchy: 1
dpa2 = Dpa.create! description: "guayas", hierarchy: 1
Dpa.create! description: "cayambe", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa1.id
Dpa.create! description: "quito", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa1.id
Dpa.create! description: "guayaquil", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa2.id
Dpa.create! description: "duran", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa2.id

genres = %w[rock pop jazz hip blues classic folk heavy_metal]
genres.each do |elem|
  Genre.create! name: elem, bg_url: Faker::LoremFlickr.image
end

tracks_id = %w[5Dqik1P9toCJTLj5rEm78s 5LYJ631w9ps5h9tdvac7yP 2Ch7LmS7r2Gy2kc64wv3Bz 0NdTUS4UiNYCNn5FgVqKQY]
params = [
  {
    name: Faker::Music.band,
    photourl: Faker::Avatar.image,
    dpa: Dpa.where(hierarchy: 2).first,
    tracks_attributes: [
      {
        name: Faker::Music::Phish.song,
        spotify_track_id: tracks_id.sample,
        track_url: "https://",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
      {
        name: Faker::Music::Phish.song,
        spotify_track_id: tracks_id.sample,
        track_url: "https://",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
    ],
  },
  {
    name: Faker::Music.band,
    photourl: Faker::Avatar.image,
    dpa: Dpa.where(hierarchy: 2).last,
    tracks_attributes: [
      {
        name: Faker::Music::Phish.song,
        spotify_track_id: tracks_id.sample,
        track_url: "https://",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
      {
        name: Faker::Music::Phish.song,
        spotify_track_id: tracks_id.sample,
        track_url: "https://",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
    ],
  },
]

params.each do |elem|
  artist = Artist.create! elem
  artist.artist_genres.create! genre: [Genre.first, Genre.last].sample
end
