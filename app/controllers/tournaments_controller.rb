class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @comment = Comment.new
    @orderplayers = @tournament.orderplayers
    # @players_tournaments_arr = PlayersTournament.where(tournament_id: @tournament.id).pluck(:tournament_id, :player_id)
    @players_tournaments = PlayersTournament.where(tournament_id: @tournament.id).all
    @plc = @players_tournaments.size
    @maxs = @tournament.maxplayers * @tournament.maxteam
    # @maxs1 = @maxs + 1 if @tournament.typetournament_id == 3
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
    @tournament.players_tournaments.build
  end

  # GET /tournaments/1/edit
  def edit
  end

  def random(maxs)
    players_total = []
    maxs.times do |l|
      players_total << l
    end
    teams_randoms = []
    maxs.times do
      select_random = players_total.sample
      teams_randoms << select_random
      players_total.delete(select_random)
    end
    return teams_randoms
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.player_id = current_player.id
    @tournament.maxteam = 2 if @tournament.typetournament_id == 3
    @maxs = @tournament.maxplayers * @tournament.maxteam
    @maxs += 1 if @tournament.typetournament_id == 3
    @tournament.orderplayers = random(@maxs)
    respond_to do |format|
      if @tournament.save
        format.html { redirect_to @tournament, notice: 'Tu torneo a sido creado con exito!' }
        format.json { render :show, status: :created, location: @tournament }
        current_player.rags -= @tournament.bet_amounts
        current_player.save
      else
        format.html { render :new }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to @tournament, notice: 'Todo correcto y actualizado!' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Torneo ELIMINADO.' }
      format.json { head :no_content }
      current_player.rags += @tournament.bet_amounts
      current_player.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:player_id, 
                                         :typetournament_id, 
                                         :game_id, 
                                         :description, 
                                         :bet_amounts, 
                                         :winner, 
                                         :maxteam, 
                                         :maxplayers, 
                                         :date,
                                         players_tournaments_attributes: [:id, :player_id, :tournament_id])
    end
end
