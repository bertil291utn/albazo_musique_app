class CreateCreditsArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :credits_artists do |t|
      t.references :rol, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
