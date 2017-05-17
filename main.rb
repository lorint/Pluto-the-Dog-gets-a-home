require './tenant'
require 'pry-byebug'
require 'fancy_gets'
include FancyGets

# puts "What address?"
# address = gets.strip

my_building = Building.new("123 Fake St")
apt_1 = Apartment.new(101, my_building)
apt_2 = Apartment.new(102, my_building)

mickey = Tenant.new("Mickey Mouse", apt_1)
minnie = Tenant.new("Minnie Mouse", apt_2)
pluto = Tenant.new("Pluto the Dog")

puts "Welcome to Tenancy"
puts "=================="
cmd = ""
until cmd == "Quit"
  cmd = gets_list(["Show","Create Apartment","Create Tenant","Move Tenant", "Quit"])
  case cmd
    when "Show"
      Building.all.each do |building|
        puts "#{building.address}:"
        building.apartments.each do |apartment|
          puts "  #{apartment.number}:"
          apartment.tenants.each do |tenant|
            puts "    #{tenant.name}"
          end
        end
      end
    when "Create Apartment"
      if Building.all.count == 1
        building = Building.all.first
        puts "Just using #{building.address}, since it's the only one"
      else
        building = gets_list(Building.all)
      end
      puts "Number:"
      Apartment.new(gets.strip.to_s, building)
    when "Create Tenant"
      apartments = []
      Building.all.each do |building|
        apartments += building.apartments.sort {|a, b| a.number <=> b.number}
      end
      puts "Apartment:"
      apartment = gets_list(apartments)
      puts "Name:"
      Tenant.new(gets.strip, apartment)
    when "Move Tenant"
      puts "Pick tenant:"
      tenant = gets_list(Tenant.all)

      apartments = []
      Building.all.each do |building|
        apartments += building.apartments.sort {|a, b| a.number <=> b.number}
      end
      puts "Pick destination:"
      apartment = gets_list(apartments)

      tenant.apartment = apartment
  end
  puts ""
end
# # Move Pluto off the street
# pluto.apartment = apt_2

# # Move all folks in apartment 2 over to apartment 1
# apt_2.tenants.each {|tenant| tenant.apartment = apt_1 }


# binding.pry
# puts "asdf"
