class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
   respond_to :html, :xml, :json

  def index
    @publications = Publication.all
    respond_with(@publications)
  end

  def show
    respond_with(@publication)
  end

  def new
    @publication = Publication.new
    respond_with(@publication)
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.save
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
      params.require(:publication).permit(:content, :url, :user_id_id, :type, :singularity)
    end
end
