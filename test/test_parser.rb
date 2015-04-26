require 'minitest/autorun'
require_relative '../lib/parser'

class TestParser < Minitest::Test
  def setup
    @parser = Parser.new 'test/files/job_posting.txt'
    @extracted_words = ["Job", "Senior", "Engineer", "Spree", "Commerce", "At", "Spree",
      "Commerce", "we", "on", "a", "mission", "to", "empower", "the", "world", "sellers",
      "through", "cutting-edge", "solutions", "that", "deliver", "stability", "flexibility",
      "and", "peace", "of", "mind"]
    @word_count = {"Job"=>1, "Senior"=>1, "Engineer"=>1, "Spree"=>2, "Commerce"=>2, "At"=>1,
      "we"=>1, "on"=>1, "a"=>1, "mission"=>1, "to"=>1, "empower"=>1, "the"=>1, "world"=>1,
      "sellers"=>1, "through"=>1, "cutting-edge"=>1, "solutions"=>1, "that"=>1, "deliver"=>1,
      "stability"=>1, "flexibility"=>1, "and"=>1, "peace"=>1, "of"=>1, "mind"=>1}
    @nouns = ["Job", "Senior", "Ruby+Fullstack", "Engineer", "Spree", "Commerce",
      "Spree", "Commerce", "mission", "world", "sellers", "cutting-edge", "solutions",
      "stability", "flexibility", "peace", "mind"]
  end

  def test_that_words_are_extracted
    assert_equal @extracted_words, @parser.extract_words
  end

  def test_that_words_are_counted
    assert_equal @word_count, @parser.count_words(@parser.extract_words)
  end

  def test_that_the_hash_is_ordered
    assert_equal @word_count, @parser.order_hash(@parser.count_words(@parser.extract_words))
  end

  def test_that_nouns_are_extracted
    assert_equal @nouns, @parser.extract_nouns
  end
end

