class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :dpas, :dpa_id, :integer, null: true
  end
end
