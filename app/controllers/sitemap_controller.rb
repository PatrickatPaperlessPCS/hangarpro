class SitemapController < ApplicationController


  def index

    @pages = ['', 'index.html.erb', 'information_for_airports.html.erb']

    @airports = Airport.all

    respond_to do |format|
      format.xml
    end
  end


end
