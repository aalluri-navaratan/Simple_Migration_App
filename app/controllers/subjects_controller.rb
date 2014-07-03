class SubjectsController < ApplicationController

    layout "admin"
    
    before_action :confirm_logged_in

    def index
    # @subjects = Subject.order("position ASC")
      @subjects = Subject.sorted
    end

    def show
      @subject = Subject.find(params[:id])
    end

    def new
      @subject = Subject.new({:name => "Default"})
      @subject_count = Subject.count + 1
    end

    def create
      # Instantiate a new object using form parameters
      @subject = Subject.new(params.require(:subject).permit(:name, :position, 
        :visible, :content_type, :content, :created_at))
        # @subject = Subject.new(subject_params)
        # Save the object
      if @subject.save
        # If save Succeeds,redirect to the index ApplicationController
        flash[:notice] = "Subject created successfully."
        redirect_to(:action => 'index')
        # If save fails ,redisplay the form so usre can fix problems
      else
        @subject_count = Subject.count + 1
        render('new')
        #redirect_to(:action => 'new')
      end
    end

    def edit
     #render :text => "fkdsk"
     @subject = Subject.find(params[:id])

     #render :text => @subject.inspect and return
     @subject_count = Subject.count
    end

    def destroy
      subject = Subject.find(params[:id]).destroy
      flash[:notice] = "Subject '#{subject.name}'  destroyed successfully."
      redirect_to(:action => 'index')
    end

    def update
      # Find an existing object  using form parameters
      @subject = Subject.find(params[:id])
      # Update the Object
      if  @subject.update_attributes(params.require(:subject).permit(:name, :position, 
        :visible, :content_type, :content, :created_at))
        # If update succeeds,redirect to the index action
        flash[:notice] = "Subject updated successfully."
        redirect_to(:action => 'show' , :id => @subject.id)
      else
        #If update succeeds,redirect the form so user can fix problems
        @subject_count = Subject.count
        render('edit')
        #redirect_to(:action => 'new')
      end
    end

    def delete
        @subject = Subject.find(params[:id])
        #subject.destroy
        #redirect_to(:action => 'index')
    end
end
        # private
        #    def subject_params
        #      params.require(:subject).permit(:name, :position, :visible)
        #    end
        # end


