class RemoveSpotifyTrackIdFromTracks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tracks, :spotify_track_id, :string
  end
end
