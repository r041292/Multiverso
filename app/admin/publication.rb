ActiveAdmin.register Publication do

  menu :label => "Publicaciones"

  actions :all, :except => [:edit, :new]

  index do
      column :content
      column :type
      column :singularity
      actions 
    end


    controller do
      # This code is evaluated within the controller class

    def destroy
    	@publication = Publication.find(params[:id])
    	Publication.delete_from_p_h(@publication)
    	@publication.destroy
      redirect_to admin_publications_path
    end
  end


end
