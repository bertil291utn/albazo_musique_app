class RenameCreditsArtistsToCreditsTracks < ActiveRecord::Migration[6.1]
  def change
    rename_table :credits_artists, :credits_tracks
  end
end
