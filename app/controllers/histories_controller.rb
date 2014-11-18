class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  def index
    @histories = History.all
    respond_with(@histories)
  end

  def show
    @publications = History.publications_from_history(@history)
    respond_with(@history)
  end

  def new
    if user_signed_in?
      @history = History.new
      respond_with(@history)
    else
      redirect_to root_path
    end
  end

  def edit
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def show_history_continuation
    @publication_id = params[:publication_id]
    @history_id = params[:history_id]
    @histories = History.histories_without_publication(@publication_id)

    if(@history_id == nil)
      @history_id = @histories[0].id
    end

    @publications = History.publications_from_history(History.find_by_id @history_id)
  end

  def continue_with_posted_publication
    @history_id = params[:history_id]
    @llink = params[:llink]
    @publication_id = params[:publication]
    actual_history_id=Publication.create_publications_and_histories(@history_id,@llink,@publication_id)
    redirect_to history_url(actual_history_id)
  end

  def show_history_include_publication
    @publication_id = params[:publication_id]
    @history_id = params[:history_id]
    @histories = History.histories_with_publication(@publication_id)

    if(@history_id == nil)
      @history_id = @histories[0].id
    end

    @publications = History.publications_from_history(History.find_by_id @history_id)
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
    PublicationsAndHistory.delete_all(["history_id = ?","#{@history.id}"])
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
