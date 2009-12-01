require 'rubygems'
require 'rake'

require './tasks/spec.rb'
require './tasks/yard.rb'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "CVEasy"
    gem.summary = "CVEasy is a ruby interface CVE database at http://cve.mitre.org."
    gem.description = "CVEasy is a ruby interface for the Common Vulnerabilities and Exposures (CVE) database at http://cve.mitre.org."
    gem.email = "dustin.webber@gmail.com"
    gem.homepage = "http://github.com/mephux/CVEasy"
    gem.authors = ["Dustin Willis Webber"]
    gem.add_dependency "nokogiri", ">= 1.4.0"
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "yard", ">=0.2.3.5"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

# vim: syntax=ruby
