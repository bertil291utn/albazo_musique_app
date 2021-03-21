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
CreditsTrack.delete_all
ArtistNetwork.delete_all
Track.delete_all
Artist.delete_all
Dpa.delete_all
Genre.delete_all
Network.delete_all
Rol.delete_all

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
    icon_url: "https://img.icons8.com/doodle/50/000000/facebook-new.png",
    url: "https://www.facebook.com/",
  },
  {
    name: "instagram",
    icon_url: "https://img.icons8.com/doodle/50/000000/instagram-new.png",
    url: "https://www.instagram.com/",
  },
  {
    name: "spotify",
    icon_url: "https://img.icons8.com/doodle/48/000000/spotify.png",
    url: "https://open.spotify.com/user/",
  },
  {
    name: "soundcloud",
    icon_url: "https://img.icons8.com/doodle/50/000000/soundcloud.png",
    url: "https://www.soundcloud.com/",
  },
  {
    name: "youtube",
    icon_url: "https://img.icons8.com/doodle/50/000000/youtube.png",
    url: "https://www.youtube.com/",
  },
  {
    name: "deezer",
    icon_url: "https://img.icons8.com/color/48/000000/deezer.png",
    url: "https://www.deezer.com/",
  },
  {
    name: "apple",
    icon_url: "https://img.icons8.com/doodle/48/000000/apple-music.png",
    url: "https://music.apple.com/us/artist/",
  },
]
# ROL

rol = %w(productor escritor interprete derechos escritor label sonido coproductores mezcla)

rol.each do |elem|
  Rol.create! name: elem
end

networks.each do |elem|
  Network.create! name: elem[:name], icon_url: elem[:icon_url], URL: elem[:url]
end

tracks_id = %w[5Dqik1P9toCJTLj5rEm78s 5LYJ631w9ps5h9tdvac7yP 2Ch7LmS7r2Gy2kc64wv3Bz 0NdTUS4UiNYCNn5FgVqKQY]
artists_id = %w[3yY2gUcIsjMr8hjo51PoJ8 2DaxqgrOhkeH0fpeiQq2f4 0C0XlULifJtAgn6ZNCW2eu 1Xyo4u8uXC1ZmMpatF05PJ]
dpaTable = Dpa.where(hierarchy: 2).to_a
params = [
  {
    name: Faker::Music.band,
    photourl: Faker::Avatar.image,
    location: Dpa.where(hierarchy: 2).first,
    spotify_artist_id: artists_id.sample,
    tracks_attributes: [
      {
        name: Faker::Music::Phish.song,
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
        album_name: Faker::Music::Phish.song,
        recorded_in: dpaTable.shuffle!.pop,
      },
      {
        name: Faker::Music::Phish.song,
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
        album_name: Faker::Music::Phish.song,
        recorded_in: dpaTable.shuffle!.pop,
      },
    ],
  },
  {
    name: Faker::Music.band,
    photourl: Faker::Avatar.image,
    location: Dpa.where(hierarchy: 2).last,
    spotify_artist_id: artists_id.sample,
    tracks_attributes: [
      {
        name: Faker::Music::Phish.song,
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
        album_name: Faker::Music::Phish.song,
        recorded_in: dpaTable.shuffle!.pop,
      },
      {
        name: Faker::Music::Phish.song,
        track_url: "https://music-cdn.icons8.com/preview_low/344/9e1b7beb-dd8d-4a99-bde4-6b6e7351ac4f.mp3",
        priority: rand(1..5),
        album_bg_url: Faker::LoremFlickr.image,
        album_name: Faker::Music::Phish.song,
        recorded_in: dpaTable.shuffle!.pop,
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
    artist.artist_networks.create! user_name: Faker::Internet.user_name, network: networkTable.shuffle!.pop
  end
end

Track.all.each do |elem|
  artistTable = Artist.all.to_a
  rolTable = Rol.all.to_a

  rand(3..4).times do
    elem.credits_tracks.create! artist: [Artist.first, Artist.last].sample, rol: rolTable.shuffle!.pop
    # elem.credits_tracks.create! artist: artistTable.shuffle!.pop, rol: rolTable.shuffle!.pop
  end
end
