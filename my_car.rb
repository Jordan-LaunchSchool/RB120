
module Towable
	def can_tow?(pounds)
		pounds < 2000
	end
end

class Vehicle
	attr_accessor :colour
	attr_reader :year, :model, :number_of_vehicles

	@@number_of_vehicles  = 0

  def initialize(year, model, colour)
		@@number_of_vehicles += 1
    @year = year
    @model = model
    @colour = colour
    @current_speed = 0
  end

	def self.gas_mileage(miles, gallons)
		puts "#{miles / gallons} miles per gallon of gas."
	end
	
	def self.get_count
		"The number of vehicles that exists is #{@@number_of_vehicles}."
	end
	
  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

	def spray_paint(colour)
    self.colour = colour
    puts "Your new #{colour} paint job looks great!"
  end

	def age
		"Your #{self.model} is #{years_old} years old."
	end

	private

	def years_old
		Time.now.year - self.year
	end
end

class MyCar < Vehicle

	NUMBER_OF_DOORS = 4
	def to_s
		"Your car is a #{colour}, #{year}, #{model}."
	end
end

class MyTruck < Vehicle
	NUMBER_OF_DOORS = 2

	include Towable

	def to_s
		"Your truck is a #{colour}, #{year}, #{model}."
	end
end

truck = MyTruck.new(2017, 'toyota hilix', 'white')
puts truck.age