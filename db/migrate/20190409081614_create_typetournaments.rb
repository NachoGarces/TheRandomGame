class CreateTypetournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :typetournaments do |t|
      t.string :typetournamentname

      t.timestamps
    end
  end
end
