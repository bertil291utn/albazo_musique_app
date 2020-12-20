class CreateDpas < ActiveRecord::Migration[6.1]
  def change
    create_table :dpas do |t|
      t.string :description
      t.integer :hierarchy
      t.string :bg_url
      t.references :dpa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
