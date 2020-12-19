json.extract! artist, :id, :name, :genre, :location, :photourl, :created_at, :updated_at
json.url artist_url(artist, format: :json)
