class Cat
	attr_reader :type

  def initialize(type)
    @type = type
  end

	def to_s
		"I'm a #{type} cat"
	end
end

tabby = Cat.new('tabby')
p "#{tabby}"