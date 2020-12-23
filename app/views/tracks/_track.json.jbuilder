json.extract! track, :id, :name, :spotify_track_id, :track_url, :priority, :abum_bg_url, :artist_id, :created_at, :updated_at
json.url track_url(track, format: :json)
