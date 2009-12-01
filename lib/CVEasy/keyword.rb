module CVEasy
  
  class Keyword
    
    def initialize(td, html)
      @td = td
      @html = html
    end

    def name
      @name = @td.at_css('td:nth-child(1) a').inner_text if @td.at_css('td:nth-child(1) a')
    end
    
    def description
      @description = @td.at_css('td:nth-child(2)').inner_text.strip if @td.at_css('td:nth-child(2)')
    end 
    
    def url
      @url = BASE_URL + @td.at_css('td:nth-child(1) a')[:href] if @td.at_css('td:nth-child(1) a')[:href]
    end
    
    def more(&block)
      cve = Nokogiri::HTML(open(url))
      block.call(Cve.new(cve.at_css('#GeneratedTable'))) if block
    end

    # def count
    #   @count ||= @html.at('b:nth-child(2)').inner_text
    # end
    # 
    # def to_s
    #   @html.at('.smaller').inner_text.strip
    # end
    
  end
end