class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy, :winner_pvp]
  before_action :authenticate_player!

  # GET /tournaments
  # GET /tournaments.json
  def index
    @tournaments = Tournament.all.reverse
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @comment = Comment.new
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
    @tournament.players_tournaments.build
  end

  # GET /tournaments/1/edit
  def edit
  end

  def random_player(maxs)
    teams_randoms = []
    maxs.times do |l|
      teams_randoms << l + 1
    end
    teams_randoms.shuffle!
    return teams_randoms
  end

  def random_mods(mods, max)
    mods_randoms = []
    mods.times do |l|
      mods_randoms << l + 1 + max
    end
    mods_randoms.shuffle!
    return mods_randoms
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)
    @tournament.player_id = current_player.id
    @ttn = @tournament.typetournament.typetournamentname
    @tournament.maxteam = 2 if @ttn == 'PvP'
    @maxs = @tournament.maxplayers * @tournament.maxteam
    @tournament.orderplayers = random_player(@maxs)
    if @ttn == 'PvP'
      @tournament.ordermods = random_mods(1, @tournament.orderplayers.max)
    else
      @tournament.ordermods = random_mods(@maxs/2, @tournament.orderplayers.max)
    end
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
      if @tournament.update(winner_pvp)
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
    end
  end

  private
    def winner_pvp
      @total = @tournament.bet_amounts * @maxs
      case tournament_params[:winner]
      when 'Azul'
        @ordermods.size.times do |m|
          rags_mod(@players_tournaments[@ordermods[m]-1].player)
        end
        @orderdelete.times do
          @orderplayers.delete(@orderplayers.min)
        end
      when 'Rojo'
        @ordermods.size.times do |m|
          rags_mod(@players_tournaments[@ordermods[m]-1].player)
        end
        @orderdelete.times do
          @orderplayers.delete(@orderplayers.max)
        end
      end
      @orderdelete.times do |p|
        rags_winners(@players_tournaments[@orderplayers[p]-1].player)
      end
      tp = tournament_params
      tp["orderplayers"] = @orderplayers
      tp["incourse"] = false if @tournament.maxplayers == @orderplayers.size

      return tp
    end

    def rags_mod(player_mod)
      player_mod.rags += (10 * @total) / 100 # 10 es el % para el mod
      player_mod.save
    end

    def rags_winners(players_winners)
      players_winners.rags += ((90 * @total) / 100) / @orderplayers.size # 90 es el % del ganador
      players_winners.points += 1
      players_winners.save
    end

  # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
      @players_tournaments = PlayersTournament.where(tournament_id: @tournament.id).all
      @orderplayers = @tournament.orderplayers
      @ordermods = @tournament.ordermods
      @plc = @players_tournaments.size
      @orderdelete = (@plc - 1) / 2
      @maxs = @tournament.maxplayers * @tournament.maxteam
      @ttn = @tournament.typetournament.typetournamentname
      @mods = @tournament.ordermods
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
                                         :orderplayers,
                                         :incourse,
                                         players_tournaments_attributes: [:id, :player_id, :tournament_id])
    end
end
