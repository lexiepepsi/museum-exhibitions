class WhitneyScraper

  def initialize(url)
    @url = url
  end

  def scrape
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    exhibitions = parsed_page.css('div.exhibitions')
    current_exhibitions = exhibitions.css('section').first
    
    featured_exhibitions = current_exhibitions.css('div.exhibitions__featured-list')
    current_featured_headers = featured_exhibitions.css('div.list-item__header')
    headers = []
    current_featured_headers.each do |header|
      header = {
        title: header.css('h2.list-item__title').text,
        dates: header.css('h2.list-item__subtitle').text
      }
      headers << header
    end

    non_featured_exhibitions = current_exhibitions.css('div.exhibitions__list')
    non_featured_headers = non_featured_exhibitions.css('div.list-item__header')
    non_featured_headers.each do |header|
      header = {
        title: header.css('h3.list-item__title').text,
        dates: header.css('h4.list-item__subtitle').text
      }
      headers << header
    end

    headers
  end

end