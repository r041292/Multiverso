class HistoriaController < ApplicationController
  before_action :set_historium, only: [:show, :edit, :update, :destroy]

  # GET /historia
  # GET /historia.json
  def index
    @historia = Historium.all
  end

  # GET /historia/1
  # GET /historia/1.json
  def show
  end

  # GET /historia/new
  def new
    @historium = Historium.new
  end

  # GET /historia/1/edit
  def edit
  end

  # POST /historia
  # POST /historia.json
  def create
    @historium = Historium.new(historium_params)

    respond_to do |format|
      if @historium.save
        format.html { redirect_to @historium, notice: 'Historium was successfully created.' }
        format.json { render action: 'show', status: :created, location: @historium }
      else
        format.html { render action: 'new' }
        format.json { render json: @historium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historia/1
  # PATCH/PUT /historia/1.json
  def update
    respond_to do |format|
      if @historium.update(historium_params)
        format.html { redirect_to @historium, notice: 'Historium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @historium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historia/1
  # DELETE /historia/1.json
  def destroy
    @historium.destroy
    respond_to do |format|
      format.html { redirect_to historia_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historium
      @historium = Historium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historium_params
      params.require(:historium).permit(:id_singularidad)
    end
end
