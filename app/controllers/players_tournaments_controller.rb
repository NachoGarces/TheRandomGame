class PlayersTournamentsController < ApplicationController
  before_action :authenticate_player!

  def create
    @tournament = Tournament.find(params[:tournament_id])
    @players_tournament = PlayersTournament.new(player_id: current_player.id, tournament_id: @tournament.id)
    @players_tournaments = PlayersTournament.where(tournament_id: @tournament.id).pluck(:tournament_id, :player_id)
    @maxs = @tournament.maxplayers * @tournament.maxteam
    ttname = @tournament.typetournament.typetournamentname
    # @maxs += 1 if @tournament.typetournament_id == 3
    @plc = @players_tournaments.size
    @t_f = false

    @plc.times do |i|
      @t_f = true if @players_tournaments[i][1] == current_player.id
    end

    if @t_f == false && current_player.rags >= @tournament.bet_amounts || @t_f == false && @plc == @maxs && ttname == 'PvP'
      @players_tournament.save
      if ttname == 'PvP' && @plc < @maxs || ttname != 'PvP'
        current_player.rags -= @tournament.bet_amounts
        current_player.save
        redirect_to tournament_path(@tournament), notice: "Bienvenido a la batalla!"
      else
        redirect_to tournament_path(@tournament), notice: "Bienvenido Moderador!"
      end
    elsif @t_f == false && current_player.rags < @tournament.bet_amounts
      redirect_to tournament_path(@tournament), alert: "No tienes suficientes Rags"
    else
      redirect_to tournament_path(@tournament), notice: "Ya estas en batalla!"
    end
  end

  private
    def players_tournament_params
      params.require(:tournament).permit(:player_id, :tournament_id)
    end
end
