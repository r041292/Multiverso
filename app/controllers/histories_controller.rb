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

  def show_history_continuation
    if(user_signed_in?)
      @signed = true
    else
      @signed = false
    end
    @publication_id = params[:publication_id]
    @history = params[:history_id]
    @histories = Array.new()
    @histories_to_exclude = Array.new()
    @publications = Array.new()

    @p_and_h= PublicationsAndHistory.find_all_by_publication_id @publication_id
    @p_and_h.each do |post|
      if(!@histories_to_exclude.include? post.history.id)
        @histories_to_exclude.push(post.history.id)
      end
    end

    @histories=History.where("id NOT IN (?)", @histories_to_exclude)

    if(@history == nil)
      @history = @histories[0].id
    end

    @p_and_h = PublicationsAndHistory.find_all_by_history_id @history
    @p_and_h.each do |post|
        @publications.push(Publication.find_by_id post.publication_id)
    end

  end

  def continue_with_posted_publication
    @history_id = params[:history_id]
    @llink = params[:llink]
    @publication_id = params[:publication]
    Publication.create_publications_and_histories(@history_id,@llink,@publication_id)
    redirect_to publication_url(@publication_id)
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
