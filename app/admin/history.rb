ActiveAdmin.register History do

  menu :label => "Historias"

  actions :all, :except => [:edit, :new]

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  controller do
      # This code is evaluated within the controller class

    def destroy
      @history_id = params[:id]
      @history = History.find(@history_id)
      @publications = PublicationsAndHistory.where("history_id = ?","#{@history_id}")
      @publications.each do |p|
        if p.publication.stories_which_belongs.length == 1
          p.publication.destroy
        end
      end
      PublicationsAndHistory.delete_all(["history_id = ?","#{@history_id}"])
      @history.destroy
      redirect_to admin_histories_path
    end
  end


end
