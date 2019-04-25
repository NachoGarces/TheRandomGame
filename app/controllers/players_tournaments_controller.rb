class PlayersTournamentsController < ApplicationController

  def new
    @players_tournament = Players_tournament.new
  end

  def create
    @players_tournament = Players_tournament.new(players_tournament_params)

    respond_to do |format|
      if @players_tournament.save
        format.html { redirect_to @players_tournament, notice: 'Has entrado a la batalla correctamente.' }
        format.json { render :show, status: :created, location: @players_tournament }
        current_player.rags -= @tournament.bet_amounts
        current_player.save
      else
        format.html { render :new }
        format.json { render json: @players_tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def players_tournament_params
      params.require(:players_tournament).permit(:player_id, :tournament_id)
    end
end
