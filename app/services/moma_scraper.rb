class MomaScraper

  def initialize(url)
    @url = url
  end

  def scrape

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

    current_dates = second_section.css('p.typography--baseline-spacing')
    dates = []
    current_dates.each do |date|
      if date.text.include?("Through")
        dates << date.text
      end
    end

    combo = []
    d = 0
    exhibitions.each do |exhibition|
      combo << exhibition
      combo << dates[d]
      d += 1
    end

    combo


  end
end