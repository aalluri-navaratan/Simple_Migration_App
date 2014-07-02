class AdminUsersController < ApplicationController
    
    layout "admin"

    before_action :confirm_logged_in

    def index
      @admin_users = AdminUser.sorted
    end
    
    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new(params.require(:admin_user).permit(:first_name, 
        :last_name, :username, :password ))
      if @admin_user.save
        flash[:notice] = "AdminUser created successfully."
        redirect_to(:action => 'index')
      else
        render('new')
      end
    end

    def edit
      @admin_user = AdminUser.find(params[:id])
    end

    def destroy
       AdminUser.find(params[:id]).destroy
       flash[:notice] = "AdminUser destroyed successfully."
       redirect_to(:action => 'index')
    end

    def update
      # Find an existing object  using form parameters
      @admin_user = AdminUser.find( params[:id] )
      # Update the Object
      if  @admin_user.update_attributes( params.require(:admin_user).permit(:first_name, 
        :last_name, :username, :password ))
        # If update succeeds,redirect to the index ApplicationController
        flash[:notice] = "AdminUser updated successfully."
        redirect_to(:action => 'show' , :id => @admin_user.id )
      else
        #If update succeeds,redirect the form so user can fix problems
        @subjects = Subject.order('position ASC')
        @admin_user_count = AdminUser.count
        render('edit')
        #redirect_to(:action => 'new')
      end
    end

    def delete
        @admin_user = AdminUser.find( params[:id] )
    end
end  
 # private

  #    def admin_user_params

  #     params.require(:admin_user).permit(:first_name, 
  #       :last_name, :username, :password )

  #    end
 
