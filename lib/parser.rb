require 'sanitize'
require 'treat'

include Treat::Core::DSL

class Parser
  attr_accessor :contents

  def initialize file_path
    @contents = document "#{file_path}"
  end

  def strip_tags
    stripped = Sanitize.fragment @contents
    stripped.split.join(' ')
  end

  def extract_nouns
    ary = []
    words = @contents.apply(:chunk, :segment, :tokenize, :category)
    words.nouns.each do |w|
      ary << w.to_s
    end
    ary
  end

  def extract_words
    ary = []
    chunked = strip_tags.apply(:chunk, :segment, :tokenize)
    chunked.each do |w|
      ary << w.to_s
    end
    ary
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
