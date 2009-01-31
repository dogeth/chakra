class ChakrasController < ApplicationController
  caches_page :index, :select, :show

  def select
    @chakras = Chakra.find(:all)
  end

  def show
    @chakra = Chakra.find_by_name(params[:chakra])
    unless @chakra 
		logger.error("Attempt to access invalid chakra: '#{params[:chakra]}'") 
	    redirect_to :action => 'index'
    end 
  end

end
