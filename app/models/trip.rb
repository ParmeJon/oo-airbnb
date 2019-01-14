class Trip

  attr_accessor :guest, :listing, :duration
  @@trips = []

  def initialize(guest, listing, duration)
    @guest = guest
    @listing = listing
    @duration = duration
    @@trips << self
  end

  def self.all
    @@trips
  end

end
