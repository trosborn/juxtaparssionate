require 'minitest/autorun'
require_relative '../lib/parser'

class TestParser < Minitest::Test
  def setup
    @parser = Parser.new 'test/files/job_posting.txt'
    @hash = { '10x' => 1, 'ninja' => 3, 'douchenozzle' => 2 }
  end

  def test_that_HTML_tags_are_stripped
    assert_equal 'ninja 10x wanted for ninja douchenozzle team', @parser.strip_tags
  end

  def test_that_words_are_cleaned
    assert_equal ["div", "ul", "li", "p", "ninja", "em", "10x", "em", "wanted", "for", "ninja", "douchenozzle", "team", "p", "li", "ul", "div"], @parser.extract_words
  end

  def test_that_words_are_counted
    array = ['10x', 'ninja', 'douchenozzle', 'ninja', 'douchenozzle', 'ninja']
    assert_equal @hash, @parser.count_words(array)
  end

  def test_that_the_hash_is_ordered
    array = [['10x', 1], ['douchenozzle', 2], ['ninja', 3]]
    assert_equal array, @parser.order_hash(@hash)
  end
end

