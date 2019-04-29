class PlayersTournamentsController < ApplicationController

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @players_tournament = PlayersTournament.new(player_id: current_player.id, tournament_id: @tournament.id)
    @players_tournaments = PlayersTournament.find_by(tournament_id: @tournament.id).pluck(:tournament_id, :player_id)
    @maxs = @tournament.maxplayers * @tournament.maxteam
    # @maxs += 1 if @tournament.typetournament_id == 3
    @plc = @players_tournaments.size
    @t_f = false

    @plc.times do |i|
      @t_f = true if @players_tournaments[i][1] == current_player.id
    end

    if @t_f == false
      @players_tournament.save
      redirect_to tournament_path(@tournament), notice: "Bienvenido a la batalla!"
      if @tournament.typetournament_id == 3 && @players_tournaments.size < @maxs || @tournament.typetournament_id < 3
        current_player.rags -= @tournament.bet_amounts
        current_player.save
      end
    elsif @t_f == true
      redirect_to tournament_path(@tournament), notice: "Ya estas en batalla!"
    else
      redirect_to tournament_path(@tournament), alert: "ERROR al ingresar"
    end
  end

  private
    def players_tournament_params
      params.require(:tournament).permit(:player_id, :tournament_id)
    end
end
