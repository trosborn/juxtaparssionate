require 'sanitize'
require 'treat'

include Treat::Core::DSL

class Parser
  attr_accessor :contents

  def initialize file_path
    @contents = document "#{file_path}"
  end

  def strip_tags
    @contents = Sanitize.fragment @contents
    remove_spaces
  end

  def remove_spaces
    @contents.split.join(' ')
  end

  def extract_nouns
    words = @contents.apply(:chunk, :segment, :tokenize, :category)
    words.nouns.map { |w| w.to_s }
  end

  def extract_words
    chunked = strip_tags.apply(:chunk, :segment, :tokenize)
    chunked.map { |w| w.to_s }
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
