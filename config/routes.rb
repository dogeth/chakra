ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'chakras'
  map.sitemap 'sitemap.xml' , :controller => 'sitemap' , :action => 'sitemap'
  map.connect 'about', :controller => 'chakras', :action => 'about'
  map.connect 'chakra', :controller => 'chakras', :action => 'select'
  map.connect 'chakra/:chakra', :controller => 'chakras', :action => 'show'
  map.connect 'goddess/:goddess', :controller => 'goddesses', :action => 'show'
end
