class SectionsController < ApplicationController
  layout false

    def index
      @sections = Section.sorted
    end

    def show
      @section = Section.find(params[:id])
    end

    def new
      @section = Section.new({:name => "Default"})
    end

    def create
      # Instantiate a new object using form parameters
      @section = Section.new(params.require(:section).permit(:page_id, :name, :position, 
        :visible, :contenet_type, :visible, :contenet_type, :content))
      # @section = section.new(section_params)
      # Save the object
      if @section.save
      # If save Succeeds,redirect to the index ApplicationController
      flash[:notice] = "section created successfully."
      redirect_to(:action => 'index')
      # If save fails ,redisplay the form so usre can fix problems
      
      else
        # render('new')
        redirect_to(:action => 'new')
      end
    end

    def edit
      @section = Section.find(params[:id])
    end

    def destroy
       section = Section.find(params[:id]).destroy
       flash[:notice] = "section '#{section.name}'  destroyed successfully."
       redirect_to(:action => 'index')
    end

    def update
      # Find an existing object  using form parameters
      @section = Section.find(params[:id])
      # Update the Object
      if  @section.update_attributes(params.require(:section).permit(:name,
       :position, :visible, :contenet_type, :content))
      # If update succeeds,redirect to the index action
      flash[:notice] = "section updated successfully."
      redirect_to(:action => 'show' , :id => @section.id)
      else
      #If update succeeds,redirect the form so user can fix problems
      #render('edit')
      redirect_to(:action => 'new')
      end
    end

    def delete
        @section = Section.find(params[:id])
        #section.destroy
        #redirect_to(:action => 'index')
    end
  # private
  #    def section_params
  #      params.require(:section).permit(:name, :position, :visible)
  #    end
  # end
end
