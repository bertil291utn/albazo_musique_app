class CreateArtistNetworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_networks do |t|
      t.string :social_link
      t.string :user_name
      t.references :artist, null: false, foreign_key: true
      t.references :network, null: false, foreign_key: true

      t.timestamps
    end
  end
end
