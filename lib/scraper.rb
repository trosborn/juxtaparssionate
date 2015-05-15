require 'mechanize'
require 'nokogiri'
require 'sanitize'
require_relative 'database/model.rb'

class Scraper
  include Model
  def self.we_work
    agent = Mechanize.new
    page = agent.get('https://weworkremotely.com/categories/2/jobs')
    page.links_with( :href => %r{/jobs/} ).each do |link|
      next if link.href == 'https://weworkremotely.com/jobs/new'
      page = link.click
      doc = page.parser
      section = doc.css('title').to_s
      section << ' | '
      section << doc.css('div.listing-container').to_s
      section.gsub! /<\/li>/, '\n'
      stripped = strip_tags section
      Model::SQLite3.save stripped
    end
  end

  #def self.save doc, index
  #  File.open "postings/job_posting#{index}.txt", 'w' do |f|
  #    f.write doc
  #  end
  #end

  def self.strip_tags section
    remove_spaces Sanitize.fragment section
  end

  def self.remove_spaces sanitized
    sanitized.split.join(' ')
  end
end
