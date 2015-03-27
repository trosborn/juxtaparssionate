require 'mechanize'
require 'nokogiri'

agent = Mechanize.new
posting = Mechanize.new

page = agent.get('https://weworkremotely.com/categories/2/jobs')

page.links_with( :href => %r{/jobs/} ).each do |link|
  next if link.href == 'https://weworkremotely.com/jobs/new'
  puts link.href
end

def file
  f = File.open('Passion.txt')
  file = f.read
  no_new_lines = file.gsub("/n", '')
end

