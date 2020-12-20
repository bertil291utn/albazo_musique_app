class ChangeColumnNullDpa < ActiveRecord::Migration[6.1]
  def change
    change_column_null :dpas, :dpa_id, true
  end
end
