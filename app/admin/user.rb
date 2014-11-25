ActiveAdmin.register User do

  menu :label => "Usuarios"

  actions :all, :except => [:edit, :new]

  index do
      column :name
      column :email
      column :admin
      column :blocked
      actions 
    end

 controller do
      # This code is evaluated within the controller class

    def destroy
      @user = User.find(params[:id])
      if @user.blocked
        @user.update_attribute(:blocked, false)
      else
        @user.update_attribute(:blocked, true)
      end
      redirect_to admin_users_path
    end
  end


end
