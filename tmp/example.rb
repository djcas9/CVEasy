$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "rubygems"
require "CVEasy"


#puts CVEasy::Query.new(:keyword => 'ruby').count

# 
CVEasy::Query.new(:keyword => 'Windows') do |cve|
  
  puts cve.name
  puts cve.description
  puts cve.url
  puts "\n"
  
  # cve.more do |info|
  #   
  #     puts info.references.inspect
  #     puts info.status
  #     puts info.phase
  #     puts info.assigned_at
  #   
  # end
  
end


# CVEasy::Query.new(:year => '2008', :cve => '1') do |cve|
#   
#   
#   puts cve.name
#   puts cve.description
#   
#   puts cve.references
#   
#   puts cve.status
#   
#   puts cve.phase
#   
#   puts cve.assigned_at
#   
# end