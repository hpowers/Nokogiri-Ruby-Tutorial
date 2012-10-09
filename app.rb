require_relative 'nine30concertsparser'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

get '/' do
  url = "http://www.930.com/concerts/"
  data = Nokogiri::HTML(open(url))
  concertsparser = Nine30ConcertsParser.new data
  @concerts = concertsparser.concerts

  erb :shows
end
