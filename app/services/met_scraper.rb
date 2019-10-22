class MetScraper

  def initialize(url)
    @url = url
  end

  def scrape
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    byebug
  end

end