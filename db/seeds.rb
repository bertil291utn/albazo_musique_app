# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

# Delete all records
ArtistGenre.delete_all
ArtistNetwork.delete_all
Track.delete_all
Artist.delete_all
Dpa.delete_all
Genre.delete_all
Network.delete_all

# DIVISION POLITICO ADMINSITRATIVA (location)
dpa1 = Dpa.create! description: "pichincha", hierarchy: 1
dpa2 = Dpa.create! description: "guayas", hierarchy: 1
Dpa.create! description: "cayambe", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa1.id
Dpa.create! description: "quito", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa1.id
Dpa.create! description: "guayaquil", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa2.id
Dpa.create! description: "duran", hierarchy: 2, bg_url: Faker::LoremFlickr.image, dpa_id: dpa2.id

# GENRES
genres = %w[rock pop jazz hip blues classic folk heavy_metal]
genres.each do |elem|
  Genre.create! name: elem, bg_url: Faker::LoremFlickr.image
end

# NETWORK
networks = [
  {
    name: "facebook",
    url: "https://img.icons8.com/doodle/50/000000/facebook-new.png",
  },
  {
    name: "instagram",
    url: "https://img.icons8.com/doodle/50/000000/instagram-new.png",
  },
  {
    name: "spotify",
    url: "https://img.icons8.com/doodle/48/000000/spotify.png",
  },
  {
    name: "soundcloud",
    url: "https://img.icons8.com/doodle/50/000000/soundcloud.png",
  },
  {
    name: "youtube",
    url: "https://img.icons8.com/doodle/50/000000/youtube.png",
  },
  {
    name: "deezer",
    url: "https://img.icons8.com/color/48/000000/deezer.png",
  },
  {
    name: "apple",
    url: "https://img.icons8.com/doodle/48/000000/apple-music.png",
  },
]

networks.each do |elem|
  Network.create! name: elem[:name], icon_url: elem[:url]
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
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
      {
        name: Faker::Music::Phish.song,
        spotify_track_id: tracks_id.sample,
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
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
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
      {
        name: Faker::Music::Phish.song,
        spotify_track_id: tracks_id.sample,
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
      },
    ],
  },
]

params.each do |elem|
  artist = Artist.create! elem
  genreTable = Genre.all.to_a
  networkTable = Network.all.to_a
  rand(1..3).times do
    artist.artist_genres.create! genre: genreTable.shuffle!.pop
  end

  rand(2..4).times do
    artist.artist_networks.create! social_link: "https://www.facebook.com/", user_name: Faker::Internet.user_name, network: networkTable.shuffle!.pop
  end
end
