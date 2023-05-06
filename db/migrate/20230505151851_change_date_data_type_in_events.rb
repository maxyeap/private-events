class ChangeDateDataTypeInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :date, 'date USING CAST(date AS date)'
  end
end
