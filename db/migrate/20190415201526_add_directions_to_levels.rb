class AddDirectionsToLevels < ActiveRecord::Migration[5.2]
  def change
    add_column :levels, :directions, :text
  end
end
