class HistoriasController < ApplicationController
  before_action :set_historia, only: [:show, :edit, :update, :destroy]

  def index
    @historias = Historia.all
  end

  def show
  end

  def new
    @historia = Historia.new
  end

  def edit
  end

  def create
    @historia = Historia.new(historia_params)

    respond_to do |format|
      if @historia.save
       format.html { redirect_to @historia, notice: 'Historia was successfully created.' }
        format.json { render action: 'show', status: :created, location: @historia }
      else
        format.html { render action: 'new' }
        format.json { render json: @historia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @historia.update(historia_params)
        format.html { redirect_to @historia, notice: 'Historia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @historia.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @historia.destroy
    respond_to do |format|
      format.html { redirect_to historias_url }
      format.json { head :no_content }
    end
  end

  private
    def set_historia
      @historia = Historia.find(params[:id])
    end

    def historia_params
      params.require(:historia).permit(:id_singularidad)
    end
end
