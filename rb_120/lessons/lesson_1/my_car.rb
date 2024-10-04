module Sunroofable
  def sunroof
    "I have a sunroof!"
  end
end

class Vehicle
  attr_reader :year, :make, :model, :current_speed, :ignition
  attr_accessor :color

  @@number_of_vehicles = 0
  def self.total_num_of_vehicles
    p "#{@@number_of_vehicles}"
  end

  def initialize(year, make, model, color)
    @year = year
    @make = make
    @model = model
    @color = color
    @current_speed = 0
    @ignition = 'off'
    @@number_of_vehicles += 1
  end

  def accelerate_by(mph)
    @current_speed += mph
    self.current_speed
  end

  def decelerate_by(mph)
    @current_speed -= mph
    self.current_speed
  end
  
  def turn_on
    @ignition = 'on'
  end
  
  def turn_off
    @ignition = 'off'
  end
  
  def spray_paint(color)
    self.color = color
  end
  
  def current_speed
    puts "You are now going #{@current_speed}mph."
  end

  def details
    puts "My vehicle is a #{color} #{year} #{make} #{model}. It is #{age} years old."
  end

  private
  def age
    Time.now.year - @year
  end
end


class MyCar < Vehicle
  include Sunroofable
  CAR = "Is short and has a trunk."
  def to_s
    "My car is a #{color} #{year} #{make} #{model}."
  end
end

class MyTruck < Vehicle
  TRUCK = "Is tall and has a bed."
  def to_s
    "My truck is a #{color} #{year} #{make} #{model}."
  end
end


my_car = MyCar.new(2007, "Honda", "Civic", "pewter")
my_car.details
my_car.current_speed
puts my_car.ignition
my_car.turn_on
puts my_car.ignition
my_car.accelerate_by(30)
my_car.decelerate_by(5)
my_car.decelerate_by(25)
my_car.turn_off
puts my_car.ignition
puts my_car.color
my_car.spray_paint('black')
puts my_car.color
my_car.details
puts my_car
my_truck = MyTruck.new(2012, "Dodge", "Ram", "silver")
puts my_truck
my_truck.details
Vehicle.total_num_of_vehicles
puts my_car.sunroof
