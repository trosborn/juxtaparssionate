require 'sanitize'

class Parser
  def initialize posting
    @word_count = {}
    File.open posting
  end

  def strip_tags string
    Sanitize.fragment string
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
