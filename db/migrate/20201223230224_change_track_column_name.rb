class ChangeTrackColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :tracks, :abum_bg_url, :album_bg_url
  end
end
