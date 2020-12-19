class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.string :location
      t.string :photourl

      t.timestamps
    end
  end
end
