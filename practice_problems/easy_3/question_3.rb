class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat_1 = AngryCat.new(10, "old cat")
cat_2 = AngryCat.new(11, "annoying cat")

cat_1.age