class AddAlbumNameToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :album_name, :string
  end
end
