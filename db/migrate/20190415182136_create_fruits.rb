class CreateFruits < ActiveRecord::Migration[5.2]
  def change
    create_table :fruits do |t|
      t.string :name
      t.string :size
      t.boolean :dancing

      t.timestamps
    end
  end
end
