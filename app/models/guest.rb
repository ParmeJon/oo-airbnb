class Guest
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def listings
    listing_arr = []
    Trip.all.each do |obj|
      if obj.guest == self
        listing_arr << obj.listing
      end
    end
    listing_arr
  end

  def trips
    Trip.all.select do |obj|
      obj.guest == self
    end
  end

  def trip_count
    self.trips.length
  end

  def self.all
    guest_arr = []
    Trip.all.each do |obj|
      guest_arr << obj.guest
    end
    guest_arr
  end

  def self.pro_traveler
    hash = {}
    Trip.all.each do |obj|
      if hash[obj.guest]
        hash[obj.guest] += 1
      else
        hash[obj.guest] = 1
      end
    end
    hash.max_by{|k,v| v}[0]
  end

  def self.find_all_by_name(guest_name)
    Trip.all.select do |obj|
      obj.guest.name == guest_name
    end
  end
end
