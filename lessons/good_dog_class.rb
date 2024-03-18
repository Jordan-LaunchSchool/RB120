class Animal
	attr_accessor :name, :age

	def initialize
	end
end

class GoodDog < Animal
	DOG_YEARS = 7

	def initialize(name, age)
		self.name = name
		self.age = age
	end

	def public_disclosure
		"#{self.name} in human years is #{human_years}"
	end

	private

	def human_years
		age * DOG_YEARS
	end
end

class BadDog < Animal
	def initialize(age, name)
		super(name)
		@age = age
	end
end

class Bear < Animal
	def initialize(colour)
		super()
		@colour = colour
	end
end

sparky = GoodDog.new("Sparky", 4)
