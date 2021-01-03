class AddDpaToTrack < ActiveRecord::Migration[6.1]
  def change
    add_reference :tracks, :dpa, null: true, foreign_key: true
  end
end
