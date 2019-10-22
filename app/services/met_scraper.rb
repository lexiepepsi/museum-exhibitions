class MetScraper

  def initialize(url)
    @url = url
  end

  def scrape
    # met_url = "https://www.metmuseum.org/exhibitions/current-exhibitions"
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    byebug
  end

end