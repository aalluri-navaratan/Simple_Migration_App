class DemoController < ApplicationController

  layout 'application'

  def index
    @array = [1,2,3,4,5]
    render('hello')
  end

  def hello
  
    @array = [1,2,3,4,5]
    @id = params[:id].to_i
    @page = params[:page].to_i
    render('index')
  end

  def other_hello
      redirect_to(:controller => 'demo', :action => 'index')
  end

  def loging
    logger.debug("this is debug.")
    logger.info("this is info.")
    logger.warn("this is warn.")
    logger.fatal("this is fatal.")
    render( :text => 'logged!')
  end
  def make_error
    #My guesses for the most common errors:
    #render(:text => "text"  # synatx error
    #render( :text => @somthing.upcase ) # undefined method
    # render(:text => "1" + 1) # can't convert type
  end

  def lynda
    redirect_to("http://lynda.com")
  end

end