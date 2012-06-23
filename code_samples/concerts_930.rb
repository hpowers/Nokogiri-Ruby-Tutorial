require 'nokogiri'
require 'open-uri'

url = "http://www.930.com/concerts/#/930/"

data = Nokogiri::HTML(open(url))

# Here is where we use the new method to create an object that holds all the
# concert listings.  Think of it as an array that we can loop through.  It's
# not an array, but it does respond very similarly.
concerts = data.css('.concert_listing')

concerts.each do |concert|
  # name of the show
  puts concert.at_css('.event').text

  # date of the show
  puts concert.at_css('.date').text

  # time of the show
  puts concert.at_css('.doors').text

  # show price or sold out
  # Remember, when a show is sold out, there is no div with the selector .price
  # What we are doing here is setting price = to that selector.  We then test
  # to see whether it is nil or not which let's us know if the show is SOLD OUT.
  price = concert.at_css('.price')
  if !price.nil?
    puts price.text
  else
    puts "SOLD OUT"
  end

  # blank line to make results prettier
  puts ""

end