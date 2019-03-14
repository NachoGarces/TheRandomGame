class CreateAcounts < ActiveRecord::Migration[5.2]
  def change
    create_table :acounts do |t|
      t.string :nicks
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
