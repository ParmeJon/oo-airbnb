require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end




home = Listing.new("chinatown")
jon = Guest.new("jon")
vacay = Trip.new(jon, home, "2 weeks")
madrid = Listing.new("madrid")
another_one = Trip.new(jon, madrid, "3 weeks")
mary = Guest.new("Mary")
girls_night = Trip.new(mary, madrid, "1 night")
# Put your variables here~!
binding.pry
