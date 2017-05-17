require './building'

class Apartment
  attr_reader :number, :building
  attr_accessor :tenants, :is_rented

  @@num_apartments = 0

  # When calling Apartment.new, Ruby calls this one for us:
  def initialize(number, building, is_rented = false)
    self.tenants = []
    @number = number
    @building = building
    building.apartments << self
    self.is_rented = is_rented

    @@num_apartments += 1
  end

  # In this case, self means the whole Apartment CLASS -- not an instance
  # We get to this with:  Apartment.num_apartments
  def self.num_apartments
    @@num_apartments
  end

  def to_s
    "#{self.building.address}: #{self.number}"
  end
end
