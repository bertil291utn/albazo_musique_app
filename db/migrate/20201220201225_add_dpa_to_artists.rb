class AddDpaToArtists < ActiveRecord::Migration[6.1]
  def change
    add_reference :artists, :dpa, foreign_key: true
  end
end
