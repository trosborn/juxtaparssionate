require 'mechanize'
require 'nokogiri'

class Parser
  def initialize
    @word_count = {}
  end

  def scrape_page
    agent = Mechanize.new
    page = agent.get('https://weworkremotely.com/categories/2/jobs')
    page.links_with( :href => %r{/jobs/} ).each do |link|
      next if link.href == 'https://weworkremotely.com/jobs/new'
      page = link.click
      doc = page.parser
      extracted_words = extract_words doc.css('div.listing-container').to_s
      count_words extracted_words
      puts order_hash @word_count
    end
  end

  def extract_words string
    string.gsub(/[<>!'";,.?\/]/, ' ').downcase.split
  end

  def count_words array
    array.each do |word|
      if @word_count[word] != nil
        @word_count[word] += 1
      else
        @word_count[word] = 1
      end
    end
    @word_count
  end

  def order_hash hash
    hash.sort_by { |key, value| value }
  end
end
=begin
agent = Mechanize.new
result = {}

page = agent.get('https://weworkremotely.com/categories/2/jobs')
page.links_with( :href => %r{/jobs/} ).each do |link|
  next if link.href == 'https://weworkremotely.com/jobs/new'
  page = link.click
  doc = page.parser
  listing = doc.css('div.listing-container').to_s.gsub(/[<>!'";,.?\/]/, ' ').downcase
  listing = listing.split(' ')
  listing.each do |word|
    if result[word] != nil
      result[word] += 1
    else
      result[word] = 1
    end
  end

  puts result
end

=end
