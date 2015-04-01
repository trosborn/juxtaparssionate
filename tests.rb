require 'minitest/autorun'
require_relative 'parser'

class TestParser < Minitest::Test
  def setup
    @parser = Parser.new
    @hash = { '10x' => 1, 'ninja' => 3, 'douchenozzle' => 2 }
  end

  def test_that_words_are_extracted
    string = '<div> OHAI! pre-processor? No, WAY/! </div>'
    assert_equal ['div', 'ohai', 'pre-processor', 'no', 'way', 'div'], @parser.extract_words(string)
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

