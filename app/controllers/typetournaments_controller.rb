class TypetournamentsController < ApplicationController
  before_action :set_typetournament, only: [:show, :edit, :update, :destroy]

  # GET /typetournaments
  # GET /typetournaments.json
  def index
    @typetournaments = Typetournament.all
  end

  # GET /typetournaments/1
  # GET /typetournaments/1.json
  def show
  end

  # GET /typetournaments/new
  def new
    @typetournament = Typetournament.new
  end

  # GET /typetournaments/1/edit
  def edit
  end

  # POST /typetournaments
  # POST /typetournaments.json
  def create
    @typetournament = Typetournament.new(typetournament_params)

    respond_to do |format|
      if @typetournament.save
        format.html { redirect_to @typetournament, notice: 'Typetournament was successfully created.' }
        format.json { render :show, status: :created, location: @typetournament }
      else
        format.html { render :new }
        format.json { render json: @typetournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typetournaments/1
  # PATCH/PUT /typetournaments/1.json
  def update
    respond_to do |format|
      if @typetournament.update(typetournament_params)
        format.html { redirect_to @typetournament, notice: 'Typetournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @typetournament }
      else
        format.html { render :edit }
        format.json { render json: @typetournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typetournaments/1
  # DELETE /typetournaments/1.json
  def destroy
    @typetournament.destroy
    respond_to do |format|
      format.html { redirect_to typetournaments_url, notice: 'Typetournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typetournament
      @typetournament = Typetournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typetournament_params
      params.require(:typetournament).permit(:typetournamentname)
    end
end
