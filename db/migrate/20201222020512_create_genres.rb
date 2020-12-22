class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :bg_url

      t.timestamps
    end
  end
end
