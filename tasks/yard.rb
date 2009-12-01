require 'yard'
 
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb']
  t.options = [
    '--protected',
    '--files', 'History.txt',
    '--title', 'Ipdb'
  ]
end
 
task :docs => :yard