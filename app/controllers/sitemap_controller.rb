class SitemapController < ApplicationController  
  caches_page :sitemap
  
	def sitemap
	  @chakras = Chakra.find(:all, :include => :goddesses)
	  render :layout => false
	end

end