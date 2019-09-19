require 'pry'

class Owner

  @@all = []

  def self.all 
    @@all 
  end 

  def self.count
    @@all.count
  end 

  def self.reset_all
    @@all.clear 
  end 

  def initialize(name)
    @owner = name 
    @species = "human"
    @@all << self 
  end 

  def name
    @owner
  end 

  def species 
    @species 
  end 

  def say_species 
    "I am a #{self.species}."
  end 

  def cats
    Cat.all.select do |a_cat|
      a_cat if a_cat.owner == self 
    end 
  end 

  def dogs 
    Dog.all.select do |a_dog|
      a_dog if a_dog.owner == self
    end 
  end 

  def buy_cat(name)
    Cat.new(name, self) 
  end

  def buy_dog(name)
    Dog.new(name, self )
  end 

  def walk_dogs
    dogs.map do |a_dog|
      a_dog.mood = "happy"
    end 
  end 

  def feed_cats
    cats.map do |a_cat|
      a_cat.mood = "happy"
    end 
  end 

  def sell_pets
    all_pets = Dog.all + Cat.all

    all_pets.map do |each_pet|
      each_pet.mood = "nervous"
      each_pet.owner = nil
    end 
  end 

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

end 