class RemoveGenreFromArtists < ActiveRecord::Migration[6.1]
  def change
    remove_column :artists, :genre, :string
  end
end
