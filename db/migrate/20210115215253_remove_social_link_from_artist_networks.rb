class RemoveSocialLinkFromArtistNetworks < ActiveRecord::Migration[6.1]
  def change
    remove_column :artist_networks, :social_link, :string
  end
end
