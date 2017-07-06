@airports.each do |airport|
  xml.url do
    xml.loc airport_path(airport)
  end

end