class HistoriasController < ApplicationController
  before_action :set_historias, only: [:show, :edit, :update, :destroy]

  # GET /historias
  # GET /historias.json
  def index
    @historias = Historia.all
  end

  # GET /historias/1
  # GET /historias/1.json
  def show
  end

  # GET /historias/new
  def new
    @historias = Historia.new
  end

  # GET /historias/1/edit
  def edit
  end

  # POST /historias
  # POST /historias.json
  def create
    @historias = Historia.new(historias_params)

    respond_to do |format|
      if @historias.save
        format.html { redirect_to @historias, notice: 'Historia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @historias }
      else
        format.html { render action: 'new' }
        format.json { render json: @historias.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historias/1
  # PATCH/PUT /historias/1.json
  def update
    respond_to do |format|
      if @historias.update(historias_params)
        format.html { redirect_to @historias, notice: 'Historia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @historias.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historias/1
  # DELETE /historias/1.json
  def destroy
    @historias.destroy
    respond_to do |format|
      format.html { redirect_to historias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historias
      @historias = Historia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historias_params
      params.require(:historias).permit(:id_singularidad)
    end
end
