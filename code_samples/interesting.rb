# nokogiri is our scraping/parsing library
# you will need to install it with "gem install nokogiri"
require 'nokogiri'

# open-uri is part of the standard library and allows you to
# download a webpage
require 'open-uri'

# I am hosting interesting.html on a local server.  This is the URL.
url = "http://localhost:4567/interesting.html"

# Here we load the URL into Nokogiri for parsing downloading the page in
# the process
data = Nokogiri::HTML(open(url))

# We can now target data in the page using css selectors.  The at_css method
# returns the first element that matches the selector.
puts data.at_css("#price").text.strip

# The text method returns the text from inside the element.
puts data.at_css("#time").text.strip

# The strip method is a standard ruby method for strings and removes
# extraneous whitespace from the output
puts data.at_css("#stock").text.strip