require './apartment'

class Tenant
  attr_reader :name, :apartment
  # attr_accessor :apartment

  @@tenants = []

  def apartment=(apartment)
    # Move out of the original apartment
    unless self.apartment.nil?
      self.apartment.tenants.reject! {|tenant| tenant == self}
    end

    @apartment = apartment

    # Move into the new apartment
    apartment.tenants << self unless apartment.nil?
  end

  @@num_tenants = 0

  # When calling Tenant.new, Ruby calls this one for us:
  def initialize(name, apartment = nil)
    @name = name
    self.apartment = apartment

    @@num_tenants += 1
    @@tenants << self
  end

  # In this case, self means the whole Tenant CLASS -- not an instance
  # We get to this with:  Tenant.num_tenants
  def self.num_tenants
    @@num_tenants
  end
  def self.all
    @@tenants
  end
  def to_s
    if self.apartment.nil?
      "Homeless #{self.name}"
    else
      "#{self.apartment.building.address}: #{self.apartment.number}, #{self.name}"
    end
  end
end
