module Walkable
	def walk
		"#{self} #{gait} forward"
	end
end

class Person
	include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

	def to_s
		name
	end

  private

  def gait
    "strolls"
  end
end

class Cat
	include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

	def to_s
		name
	end

  private

  def gait
    "saunters"
  end
end

class Cheetah
	include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

	def to_s
		name
	end

  private

  def gait
    "runs"
  end
end

class Noble < Person
	attr_reader :title

	def initialize(name, title)
		super(name)
		@title = title
	end

	def to_s
		"#{title} #{name}"
	end

	private

	def gait
		"struts"
	end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk