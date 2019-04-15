class CreatePlates < ActiveRecord::Migration[5.2]
  def change
    create_table :plates do |t|
      t.string :color
      t.boolean :fancy
      t.boolean :dancing

      t.timestamps
    end
  end
end
