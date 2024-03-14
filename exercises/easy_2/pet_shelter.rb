class Pet
	attr_reader :animal_type, :name
	def initialize(animal_type, name)
		@animal_type = animal_type
		@name = name
	end
end

class Owner
	attr_accessor :pets
	attr_reader :name

	def initialize(name)
		@name = name
		@pets = []
	end

	def number_of_pets
		@pets.size
	end

	def add_pet(pet)
		@pets << pet
	end
end

class Shelter
	attr_accessor :owners_pets

	def initialize
		@owners_pets = {}
	end

	def adopt(owner, pet)
		owner.add_pet(pet)
		@owners_pets[owner.name] = owner.pets
	end

	def print_adoptions
		@owners_pets.each do |owner, pets|
			puts "#{owner} has adopted the following pets:"
			pets.each do |pet|
				puts "a #{pet.animal_type} named #{pet.name}"
			end
			puts ""
		end
	end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."