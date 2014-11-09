class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
   respond_to :html, :xml, :json

  def index
    @publications = Publication.order('id DESC')
    @histories = History.order('id DESC').limit(5)
    @singularity = History.first
    respond_with(@publications)
  end

  def show
    respond_with(@publication)
  end

  def singularities
    @publications = Publication.find_all_by_singularity true
  end

  def continue_publication
    @history_id = params[:history_id]
    @llink = params[:llink]
    @publication = Publication.new
    respond_with(@publication)
  end

  def create_continue_publication
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id
    @publication.singularity = false
    @publication.save
    @history_id = params[:history_id]
    @llink = params[:llink]
    Publication.create_publications_and_histories(@history_id,@llink,@publication.id)
    respond_with(@publication)
  end

  def search
    search_params = params[:search]
    @publications = Publication.where("content LIKE ? OR url LIKE ?","%#{search_params}%","%#{search_params}%")
  end

  def new
    @publication = Publication.new
    respond_with(@publication)
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user_id = current_user.id
    if(current_user.admin)
      @publication.singularity = true
    else
      @publication.singularity = false
    end
    @publication.save
    respond_with(@publication)
  end


  def update
    @publication.update(publication_params)
    respond_with(@publication)
  end

  def destroy
    Publication.delete_from_p_h(@publication)
    @publication.destroy
    respond_with(@publication)
  end

  private
    def set_publication
      @publication = Publication.find(params[:id])
    end

    def publication_params
      params.require(:publication).permit(:content, :url, :user_id, :type, :singularity)
    end
end
