class MomaScraper

  def initialize(url)
    @url = url
  end

  def scrape
    # moma_url = "https://www.moma.org/calendar/exhibitions"
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    main = parsed_page.css('main.main')
    second_section = main.css('section.page-section--full-bleed')[1]
    
    current_exhibitions = second_section.css('p.typography--hyphenate')
    exhibitions = []
    poop = []
    n = 0
    current_exhibitions.each do |exhibition|
        if n == 0
          poop << exhibition.text
          exhibitions << exhibition.text
          n += 1
        elsif n == 2
          n = 0
          poop = []
        elsif n == 1
          poop << exhibition.text
          if poop[0] == poop[1]
            n = 0
            poop = []
          else
            n += 1
          end
        end  
    end

    exhibitions

    # byebug
  end
end

# main = parsed_page.css('main.main')
# second_section = main.css('section.page-section--full-bleed')[1]
# info = second_section.css('p.balance-text')