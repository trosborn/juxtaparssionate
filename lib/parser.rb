require 'treat'

include Treat::Core::DSL

class Parser
  attr_accessor :contents
  attr_accessor :post_attributes

  def initialize file_path
    @contents = document("#{file_path}").apply :chunk, :segment, :tokenize, :category
    @post_attributes = { :noun_percent => 0, :word_popularity => {} }
  end

  def noun_percent
    @post_attributes[:noun_percent] = (@contents.noun_count.to_f / @contents.word_count).round(2)
  end

  def extract_nouns
    @contents.nouns.map { |w| w.to_s }
  end

  def extract_words
    @contents.words.map { |n| n.to_s }
  end

  def count_words array
    array.each do |word|
      if @post_attributes.word_popularity[word] != nil
        @post_attributes.word_popularity[word] += 1
      else
        @post_attributes.word_popularity[word] = 1
      end
    end
    @post_attributes.word_popularity
  end

  def order_hash hash
    hash.sort_by { |key, value| value }
  end
end
