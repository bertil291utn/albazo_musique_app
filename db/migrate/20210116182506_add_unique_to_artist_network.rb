class AddUniqueToArtistNetwork < ActiveRecord::Migration[6.1]
  def change
    add_index :artist_networks, [:artist_id, :network_id], unique: true
  end
end
