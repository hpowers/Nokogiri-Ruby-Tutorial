require 'time'
require 'nokogiri'

class Nine30ConcertsParser
  attr_reader :concerts
  @@tags = { :concerts => ".list-view-item".freeze,
             :date     => ".dates".freeze,
             :title    => ".headliners a".freeze,
             :time     => ".value-title".freeze,
             :price    => ".price-range".freeze,
             :soldout  => ".custom".freeze,
             :buy      => ".tickets".freeze }.freeze
  
  def initialize parsedhtml
    parsedconcerts = parsedhtml.css(@@tags[:concerts])
    @concerts = parsedconcerts.map{ |concert|
      c = { :date    => getdate(concert),
            :title   => gettitle(concert),
            :time    => gettime(concert),
            :price   => getprice(concert),
            :soldout => issoldout?(concert),
            :buy     => getbuy(concert)}
    }
  end
  
  private

  def getdate concert
    concert.at_css(@@tags[:date])
  end

  def gettitle concert
    concert.at_css(@@tags[:title])
  end

  def gettime concert
    time = concert.at_css(@@tags[:time])[:title]
    Time.parse(time).strftime("%r")
  end

  def getprice concert
    concert.at_css(@@tags[:price])
  end

  def issoldout? concert
    concert.at_css(@@tags[:soldout]).nil?
  end

  def getbuy concert
    unless concert.at_css(@@tags[:buy]).nil?
      concert.at_css(@@tags[:buy])[:href]
    end
  end
end
