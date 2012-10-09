gem "test-unit"
require 'test/unit'
require_relative '../nine30concertsparser.rb'

class TestNine30ConcertsParser < Test::Unit::TestCase
  @@root = File.expand_path(File.dirname(__FILE__)).freeze
  @@filename = "930concerts.html".freeze

  def self.startup
    html = IO.read(File.join(@@root, @@filename))  
    parsedhtml = Nokogiri::HTML(html)
    concertsparser = Nine30ConcertsParser.new parsedhtml
    @@concerts = concertsparser.concerts
  end
  
  def test_concerts_not_null
    assert_not_nil @@concerts
  end

  def test_concert_date
    assert_not_nil @@concerts[0][:date]
  end

  def test_concert_title
    assert_not_nil @@concerts[0][:title]
  end

  def test_concert_time
    assert_not_nil @@concerts[0][:time]
  end

  def test_concert_price
    assert_not_nil @@concerts[0][:price]
  end
  
  def test_concert_sold_out
    assert_not_nil @@concerts[1][:soldout]
  end

  def test_concert_buy
    assert_not_nil @@concerts[0][:buy]
  end
end
