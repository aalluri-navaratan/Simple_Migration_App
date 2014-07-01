class PagesController < ApplicationController
  layout false

    def index
      @pages = Page.sorted
    end

    def show
      @page = Page.find(params[:id])
    end

    def new
      @page = Page.new({:name => "Default"})
    end

    def create
      # Instantiate a new object using form parameters
      @page = Page.new(params.require(:page).permit(:subject_id, :name, 
        :permalink, :position, :visible))
      # @pages = Page.new(subject_params)
      # Save the object
      if @page.save
      # If save Succeeds,redirect to the index ApplicationController
      flash[:notice] = "Page created successfully."
      redirect_to(:action => 'index')
      # If save fails ,redisplay the form so usre can fix problems
      
      else
        # render('new')
        redirect_to(:action => 'new')
      end
    end

    def edit
      @page = Page.find(params[:id])
    end

    def destroy
       page = Page.find(params[:id]).destroy
       flash[:notice] = "Page destroyed successfully."
       redirect_to(:action => 'index')
    end

    def update
      # Find an existing object  using form parameters
      @page = Page.find(params[:id])
      # Update the Object
      if  @page.update_attributes(params.require(:page).permit(:subject_id, :name, 
        :permalink, :position, :visible))
       # If update succeeds,redirect to the index action
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show' , :id => @page.id)
      else
      #If update succeeds,redirect the form so user can fix problems
      #render('edit')
      redirect_to(:action => 'new')
      end
    end

    def delete
        @page = Page.find(params[:id])
    end
  # private
  #    def subject_params
  #      params.require(:subject).permit(:name, :position, :visible)
  #    end
  # end
end
