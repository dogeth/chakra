class GoddessesController < ApplicationController
#kkk caches_page
    def show
  	if params[:goddess].to_i > 0 
  		@goddess = Goddess.find_by_number(params[:goddess])
  		redirect_to :goddess => @goddess.name
	end

	@goddess = Goddess.find_by_name(params[:goddess])
  end

end
