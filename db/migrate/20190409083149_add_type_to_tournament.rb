class AddTypeToTournament < ActiveRecord::Migration[5.2]
  def change
    add_reference :tournaments, :typetournament, foreign_key: true
    add_column :tournaments, :maxteam, :integer
    add_column :tournaments, :maxplayers, :integer
  end
end
