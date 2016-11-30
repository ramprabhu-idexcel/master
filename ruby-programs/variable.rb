# Below is the example for class level variable & class level instance variable

class Parent
  @things = []

  def self.things
    @things
  end
end

class Child < Parent
  @things = []
end

Parent.things << :car
Parent.things << :bike
puts "######### Instance Variable ##########"
puts Child.things



class Parent
  @@things = []

  def self.things
    @@things
  end
end

class Child < Parent
  @@things = []
end

Parent.things << :car
Parent.things << :bike
puts "######### Class Variable ##########"
puts Child.things