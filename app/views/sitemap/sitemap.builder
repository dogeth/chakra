xml.instruct! 
xml.urlset :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do

	xml.url do
	    xml.loc 'http://chakra.goddess.com.au'
		#xml.lastmod Time.now.xmlschema
		xml.changefreq 'monthly'
		xml.priority '1.0'
	end

	xml.url do
	    xml.loc url_for(:only_path => false, :controller => 'chakras', :action => 'select')
		#xml.lastmod Time.now.xmlschema
		xml.changefreq 'monthly'
		xml.priority '0.8'
	end

	xml.url do
	    xml.loc url_for(:only_path => false, :controller => 'chakras', :action => 'about')
		#xml.lastmod Time.now.xmlschema
		xml.changefreq 'monthly'
		xml.priority '0.1'
	end

	@chakras.each do |chakra| 
		
		xml.url do
		    xml.loc url_for(:only_path => false, :controller => 'chakras', :chakra => chakra.name, :action => 'show')
		    xml.lastmod chakra.updated_at.xmlschema
			xml.changefreq 'monthly'
			xml.priority '0.5'
		end

		chakra.goddesses.each do |goddess|
			xml.url do
			    xml.loc url_for(:only_path => false, :controller => 'goddesses', :goddess => goddess.name, :action => 'show')
			    xml.lastmod chakra.updated_at.xmlschema
				xml.changefreq 'monthly'
				xml.priority '0.4'
			end
		end
		
	end
	

end
