class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.references :player, foreign_key: true
      t.string :description
      t.integer :bet_amounts
      t.string :winner

      t.timestamps
    end
  end
end
