class HomeController < ApplicationController

  def index
    whitney_url = "https://whitney.org/exhibitions"
    @whitney_headers = WhitneyScraper.new(whitney_url).scrape
  end

end