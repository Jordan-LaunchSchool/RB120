class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

#=> "You will " + 1 of "visit Vegas", "fly to Fiji", "romp in Rome"
# This is because Ruby will first look for the choices method within the RoadTrip class