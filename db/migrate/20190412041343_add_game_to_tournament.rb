class AddGameToTournament < ActiveRecord::Migration[5.2]
  def change
    add_reference :tournaments, :game, foreign_key: true
  end
end
