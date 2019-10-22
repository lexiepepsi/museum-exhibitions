class HomeController < ApplicationController

  def index
    whitney_url = "https://whitney.org/exhibitions"
    @whitney_headers = WhitneyScraper.new(whitney_url).scrape

    moma_url = "https://www.moma.org/calendar/exhibitions"
    @moma = MomaScraper.new(moma_url).scrape

    # met_url = "https://www.metmuseum.org/exhibitions/current-exhibitions"
    # @met = MetScraper.new(met_url).scrape
  end

end