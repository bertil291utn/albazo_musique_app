class RemoveLocationFromArtists < ActiveRecord::Migration[6.1]
  def change
    remove_column :artists, :location, :string
  end
end
