class Listing

  attr_reader :city

  def initialize(city)
    @city = city
  end

  def guests
    listing_guests = []
    Trip.all.each do |obj|
      if obj.listing == self
        listing_guests << obj.guest
      end
    end
    listing_guests
  end

  def trips
    Trip.all.select do |obj| obj.listing == self end
  end

  def trip_count
    self.trips.length
  end

  def self.all
    Trip.all.select do |obj| obj.listing end
  end

  def self.find_all_by_city(city_string)
    city_arr = []
    Trip.all.each do |obj|
      if obj.listing.city == city_string
        city_arr << obj.listing
      end
    end
    city_arr
  end

  def self.most_popular
    hash = {}
    Trip.all.each do |obj|
      if hash[obj.listing]
        hash[obj.listing] += 1
      else
        hash[obj.listing] = 1
      end
    end
    hash.max_by{|k,v| v}[0]
  end


end
