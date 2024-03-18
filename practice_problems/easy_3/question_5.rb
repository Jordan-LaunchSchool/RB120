class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer #Undefined method, class method called from instance
tv.model #call model instance method

Television.manufacturer #class method called
Television.model	#undefined method, instance method called from class.