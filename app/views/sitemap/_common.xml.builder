base_url = "http://#{request.host_with_port}/"

# pages = ['index.html', 'information_for_airports.html' ]

@pages.each do |page|
  xml.url do
    xml.loc base_url+page
  end

end