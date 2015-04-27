require 'treat'

include Treat::Core::DSL

class Parser
  attr_accessor :contents

  def initialize file_path
    @contents = document("#{file_path}").apply :chunk, :segment, :tokenize, :category
    @post_attributes = { :nouns => 0, :num_words => 0, :popular_words => 0}
  end

  def extract_nouns
    @contents.nouns.map { |w| w.to_s }
  end

  def extract_words
    @post_attributes[] = @contents.words.map { |n| n.to_s }
  end

  def count_words array
    word_count = {}
    array.each do |word|
      if word_count[word] != nil
        word_count[word] += 1
      else
        word_count[word] = 1
      end
    end
    word_count
  end

  def order_hash hash
    hash.sort_by { |key, value| value }
  end
end
