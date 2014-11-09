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
    @publication = Publication.new
    respond_with(@publication)
  end

  def edit
  end

  def create
    @publication = Publication.new(publication_params)
    @publication.save

    @history_id = params[:history_id]
    @llink = params[:llink]
    @p_and_h= PublicationsAndHistory.where("history_id = #{@history_id} AND publication_id = #{@llink}")
    @p_and_h.each do |publ|
      if publ.rlink_id == nil
      publ.rlink_id = @publication.id
      publ.save

      @n_ph = PublicationsAndHistory.new
      @n_ph.llink_id = @llink
      @n_ph.publication_id = @publication.id
      @n_ph.history_id = @history_id
      @n_ph.save
    end
      puts "its not nill i must create a new history omg with publication #{@publication.id}"
      @n_history= History.new
      @temp_history = History.find(@history_id)
      @n_history.publication_id = @temp_history.publication_id
      @n_history.save
      @n_ph= PublicationsAndHistory.where("history_id = #{@history_id}")
      @n_ph.each do |posts|
        @temp_ph = PublicationsAndHistory.new
        @temp_ph.history_id = @n_history.id
        if(posts.publication_id == Integer(@llink))
          puts "yes publicacion encontrada"
          @temp_ph.llink_id = posts.llink_id
          @temp_ph.publication_id = posts.publication_id
          @temp_ph.rlink_id = @publication.id
          @temp_ph.save

          @temp_ph = PublicationsAndHistory.new
          @temp_ph.llink_id = @llink
          @temp_ph.publication_id = @publication.id
          @temp_ph.history_id = @n_history.id
          @temp_ph.save
          break
        else
          @temp_ph.rlink_id = posts.rlink_id
          @temp_ph.llink_id = posts.llink_id
          @temp_ph.publication_id = posts.publication_id
          @temp_ph.save
        end

      end

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
