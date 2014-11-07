class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @histories = History.all
    respond_with(@histories)
  end

  def show
    respond_with(@history)
  end

  def new
    @history = History.new
    respond_with(@history)
  end

  def edit
  end

  def create
    @history = History.new(history_params)
    @history.save
    respond_with(@history)
  end

  def update
    @history.update(history_params)
    respond_with(@history)
  end

  def destroy
    @history.destroy
    respond_with(@history)
  end

  private
    def set_history
      @history = History.find(params[:id])
    end

    def history_params
      params.require(:history).permit(:publication_id_id)
    end
end
