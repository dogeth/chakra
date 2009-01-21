class ChakrasController < ApplicationController
  #kkk caches_page
  def index
  end

  def select
    @chakras = Chakra.find(:all)
  end

  def show
    @chakra = Chakra.find_by_name(params[:chakra])
  end

end
