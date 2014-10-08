class PublicacionesController < ApplicationController
  before_action :set_publicacione, only: [:show, :edit, :update, :destroy]

  # GET /publicaciones
  # GET /publicaciones.json
  def index
    @publicaciones = Publicacion.all
  end

  # GET /publicaciones/1
  # GET /publicaciones/1.json
  def show
  end

  # GET /publicaciones/new
  def new
    @publicacione = Publicacion.new
  end

  # GET /publicaciones/1/edit
  def edit
  end

  # POST /publicaciones
  # POST /publicaciones.json
  def create
    @publicacione = Publicacion.new(publicacione_params)

    respond_to do |format|
      if @publicacione.save
        format.html { redirect_to @publicacione, notice: 'Publicacion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @publicacione }
      else
        format.html { render action: 'new' }
        format.json { render json: @publicacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicaciones/1
  # PATCH/PUT /publicaciones/1.json
  def update
    respond_to do |format|
      if @publicacione.update(publicacione_params)
        format.html { redirect_to @publicacione, notice: 'Publicacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @publicacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicaciones/1
  # DELETE /publicaciones/1.json
  def destroy
    @publicacione.destroy
    respond_to do |format|
      format.html { redirect_to publicaciones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicacione
      @publicacione = Publicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicacione_params
      params.require(:publicacione).permit(:texto, :url, :tipo, :id_autor)
    end
end
