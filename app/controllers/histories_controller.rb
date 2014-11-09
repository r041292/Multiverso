class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @histories = History.all
    respond_with(@histories)
  end

  def show
    if(user_signed_in?)
      @signed = true
    else
      @signed = false
    end
    @p_and_h= PublicationsAndHistory.find_all_by_history_id @history.id
    @publications = Array.new()
    @p_and_h.each do |publ|
      @publications.push(Publication.find_by_id publ.publication_id)
    end
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
      params.require(:history).permit(:publication_id)
    end
end
