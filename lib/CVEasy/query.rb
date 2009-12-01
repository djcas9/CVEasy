require "CVEasy/keyword"
require "CVEasy/cve"
require "nokogiri"
require "open-uri"
require "uri"

module CVEasy

  BASE_URL = "http://cve.mitre.org"
  CVE_URL = "#{BASE_URL}/cgi-bin/cvename.cgi?name=CVE-"
  KEYWORD_URL = "#{BASE_URL}/cgi-bin/cvekey.cgi?keyword="

  class Query < Keyword

    def initialize(options={}, &block)

      @year = options[:year]
      @cve = options[:cve]
      @keyword = options[:keyword]

      if options[:keyword]

        @url = "#{KEYWORD_URL}#{URI.escape(@keyword)}"
        @html ||= Nokogiri::HTML(open(@url))

        @html.css('#TableWithRules tr').each do |td|
          # Skip The First TD - Used as TH.
          next if td.at('a').nil?

          block.call(Keyword.new(td, @html)) if block

        end
      else

        @url = "#{CVE_URL}#{@year}-#{URI.escape(@cve)}"
        @html = Nokogiri::HTML(open(@url))
        block.call(Cve.new(@html.at_css('#GeneratedTable'))) if block

      end
    end
    
    def version
      @version ||= @html.at('.smaller , b:nth-child(2)').inner_text
    end

  end
end
