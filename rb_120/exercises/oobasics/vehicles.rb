module Towable
  def tow
    p "I can tow a trailer."
  end
end

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end

  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year)
    @bed_type = bed_type
  end

  def start_engine(speed)
    super() + " Drive #{speed} please!"
  end

  include Towable
end

class Car < Vehicle
end


car1 = Car.new(2006)
puts car1.year

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

puts truck1.start_engine('fast')

truck1.tow