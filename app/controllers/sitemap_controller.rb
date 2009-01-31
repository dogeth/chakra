class SitemapController < ApplicationController  
	
	def sitemap
	  @chakras = Chakra.find(:all, :include => :goddesses)
	  render :layout => false
	end

end