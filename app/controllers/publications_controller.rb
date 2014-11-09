class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
   respond_to :html, :xml, :json

  def index
    @publications = Publication.all
    @singularity = History.first
    respond_with(@publications)
  end

  def show
    respond_with(@publication)
  end

  def new
    @history_id = params[:history_id]
    @llink = params[:llink]
    if(@history_id!=nil and @llink!=nil and !current_user.admin)
      @publication = Publication.new
      respond_with(@publication)
    else
      if(current_user.admin)
        @publication = Publication.new
        respond_with(@publication)
      else
        redirect_to :action => 'index', :notice => 'Something went wrong.'
      end
    end

  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.save

    @history_id = params[:history_id]
    @llink = params[:llink]
    if(!current_user.admin)
      Publication.create_publications_and_histories(@history_id,@llink,@publication.id)
    end
    respond_with(@publication)
  end

  def update
    @publication.update(publication_params)
    respond_with(@publication)
  end

  def destroy
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
