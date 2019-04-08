class CreateNicknames < ActiveRecord::Migration[5.2]
  def change
    create_table :nicknames do |t|
      t.string :nick
      t.references :player, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
