class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#1
hello = Hello.new
hello.hi #"Hello"

#2
hello = Hello.new
hello.bye #NoMethodError

#3
hello = Hello.new
hello.greet #0 arguments given, expected 1

#4
hello = Hello.new
hello.greet("Goodbye")
#+> "Goodbye"

Hello.hi #NoMethodError
