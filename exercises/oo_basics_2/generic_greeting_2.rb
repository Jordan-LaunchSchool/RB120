class Cat
  attr_reader :name
	@@number_of_cats = 0

	def self.total
		@@number_of_cats
	end

  def initialize(name)
    @name = name
		@@number_of_cats += 1
  end

	def self.generic_greeting
		puts "Hello! I'm a cat!"
	end

	def personal_greeting
		puts "Hello! My name is #{name}!"
	end
end

