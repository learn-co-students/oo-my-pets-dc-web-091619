require "pry"


# create and build out owner class since dog and cat depend on it

class Owner
  
  # setting class variable
  @@all = []

  # reader exposes instance vars but can't override them; shortcut so don't have to write an explicit getter method below
  # writer exposes and allows instance vars to be overwritten later
  # accessor combines both

  attr_reader :name, :species
  attr_accessor :count
  
# instance vars created so new instance has these when first created 
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @count
  end

  def say_species 
    p "I am a #{self.species}."
    # interpolate @species instance var
    # could also have interpolated #{@species} but better to use self.species method
  end

  # class methods denoted by "self"
  def self.all
   @@all
  end
 
  def self.count
    self.all.count
      # could also do @@all.length -or- self.all.length
  end

  def self.reset_all
    self.all.clear
    # could also do @@all = [] but not good practice to reference class vars directly in case class var name changes
  end

  def cats
    Cat.all.select{|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog|
    dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)    
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end