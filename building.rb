class Building
  attr_accessor :num_floors, :apartments
  attr_reader :address

  @@num_buildings = 0
  @@buildings = []

  # def apartments
  #   @apartments
  # end
  # def apartments=(val)
  #   @apartments = val
  #   # Go to the database and record the time and the nature of the change...
  # end

  # When calling Building.new, Ruby calls this one for us:
  def initialize(address, num_floors = 1)
    self.apartments = []
    @address = address
    self.num_floors = num_floors

    @@num_buildings += 1
    @@buildings << self
  end

  # In this case, self means the whole Building CLASS -- not an instance
  # We get to this with:  Building.num_buildings
  def self.num_buildings
    @@num_buildings
  end
  def self.all
    @@buildings
  end

  def to_s
    "#{self.address} with #{self.apartments.count} apartments"
  end
end
