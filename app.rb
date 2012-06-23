# The primary requirement of a Sinatra application is the sinatra gem.
# If you haven't already, install the gem with 'gem install sinatra'
require 'sinatra'

require 'nokogiri'
require 'open-uri'

# sinatra allows us to respond to route requests with code.  Here we are 
# responding to requests for the root document - the naked domain.
get '/' do
  # the first two lines are lifted directly from our previous script
  url = "http://www.930.com/concerts/#/930/"
  data = Nokogiri::HTML(open(url))
  
  # this line has only be adjusted slightly with the inclusion of an ampersand
  # before concerts.  This creates an instance variable that can be referenced
  # in our display logic (view).
  @concerts = data.css('.concert_listing')
  
  # this tells sinatra to render the Embedded Ruby template /views/shows.erb
  erb :shows
end