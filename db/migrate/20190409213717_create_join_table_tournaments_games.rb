class CreateJoinTableTournamentsGames < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tournaments, :games do |t|
      # t.index [:tournament_id, :game_id]
      # t.index [:game_id, :tournament_id]
    end
  end
end
