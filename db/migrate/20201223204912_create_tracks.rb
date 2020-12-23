class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :spotify_track_id
      t.string :track_url
      t.integer :priority
      t.string :abum_bg_url
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
