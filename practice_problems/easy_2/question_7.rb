class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

#each time a new object of the Cat class is instantiated, cats_count
# is reassigned to iteself + 1. When the class method cats_count is called,
# the method return the value the cats_count instance variable is referencing.

new_cat = Cat.new('fury')
p Cat.cats_count
new_cat_2 = Cat.new('ginger')
p Cat.cats_count