class GoddessesController < ApplicationController
  caches_page :show
  
  def show
	  @goddess = Goddess.find_by_name(params[:goddess], :include => :chakra)
    unless @goddess 
		  logger.error("Attempt to access invalid goddess: '#{params[:goddess]}'") 
	    redirect_to :controller => 'chakras', :action => 'index'
    end
    render :layout => 'chakras'
  end

end
