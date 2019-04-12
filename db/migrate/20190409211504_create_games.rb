class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :namegame
      t.integer :maxplayers
      t.string :description
      t.integer :year
      t.string :developer
      t.string :logo

      t.timestamps
    end
  end
end
