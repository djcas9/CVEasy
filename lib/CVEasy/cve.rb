module CVEasy

  class Cve

    def initialize(html)
      @html = html
    end

    def name
      @name = @html.at_css('h2').inner_text.strip if @html.at_css('h2')
    end

    def description
      @description = @html.at_css('tr:nth-child(4)').inner_text.strip if @html.at_css('tr:nth-child(4)')
    end

    def references
      unless @refs
        @refs = []
        @html.css('li a').each do |link|
          @refs << ["#{link[:href]}"]
        end
      end
      @refs
    end
    
    def status
      @status = @html.at_css('tr:nth-child(9) b').inner_text
    end

    def phase
      @phase = @html.at_css('tr:nth-child(11) td').inner_text
    end
    
    def assigned_at
      @assigned_at = @html.at_css('tr:nth-child(16) .note').inner_text.strip
    end


  end

end
