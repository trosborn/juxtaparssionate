require 'mechanize'
require 'nokogiri'

agent = Mechanize.new

def file
  page = agent.get('https://weworkremotely.com/categories/2/jobs')
  page.links_with( :href => %r{/jobs/} ).each do |link|
    next if link.href == 'https://weworkremotely.com/jobs/new'
    page = link.click
    doc = page.parser
    puts doc.css('div.listing-container').to_s.gsub('<', ' ').gsub('>', ' ')
  end
end

