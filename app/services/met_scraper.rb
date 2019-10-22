class MetScraper

  def initialize(url)
    @url = url
  end

  def scrape
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    general_content = parsed_page.css('div.general-content')

    titles = []
    general_content.css('p').each do |title|
      infos = title.text.split("\n")
      infos.each do |info|
        if !info.include?(",") && !info.include?("Location")
          titles << info
        end
      end
    end
    titles

    # dates = []
    # general_content.css('p').each do |title|
    #   infos = title.text.split("\n")
    #   infos.each do |info|
    #     if info.include?(",")
    #       dates << info
    #     end
    #   end
    # end

    # combo = []
    # d = 0
    # titles.each do |title|
    #   combo << title
    #   combo << dates[d]
    #   d += 1
    # end

    # combo
  end
end
