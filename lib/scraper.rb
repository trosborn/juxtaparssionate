require 'mechanize'
require 'nokogiri'

class Scraper
  def we_work
    agent = Mechanize.new
    page = agent.get('https://weworkremotely.com/categories/2/jobs')
    page.links_with( :href => %r{/jobs/} ).each_with_index do |link, index|
      next if link.href == 'https://weworkremotely.com/jobs/new'
      page = link.click
      doc = page.parser
      extracted_words = doc.css('title').to_s
      extracted_words << doc.css('div.listing-container').to_s
      save extracted_words, index
    end
  end

  def save doc, index
    File.open "postings/job_posting#{index}.txt", 'w' do |f|
      f.write doc
    end
  end
end
