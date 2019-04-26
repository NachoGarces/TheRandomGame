class PlayersTournamentsController < ApplicationController

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @players_tournament = PlayersTournament.new(player_id: current_player.id, tournament_id: @tournament.id)

    if @players_tournament.save
      redirect_to tournament_path(@tournament), notice: "Ya estas en la batalla"
      current_player.rags -= @tournament.bet_amounts
      current_player.save
    else
      redirect_to tournament_path(@tournament), notice: "ERROR al ingresar"
    end
  end

  private
    def players_tournament_params
      params.require(:tournament).permit(:player_id, :tournament_id)
    end
end
