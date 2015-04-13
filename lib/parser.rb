require 'sanitize'

class Parser
  attr_accessor :contents

  def initialize file_path
    open_file file_path
  end

  def open_file posting
    file = File.open posting
    @contents = file.read
  end

  def strip_tags
    stripped = Sanitize.fragment @contents
    stripped.split.join(' ')
  end

  def extract_words
    @contents.gsub(/[<>!'";,.?\/]/, ' ').downcase.split
  end

  def count_words array
    @word_count = {}
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
