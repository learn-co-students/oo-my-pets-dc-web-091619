require "pry"
require_relative "./cat.rb"
require_relative "./dog.rb"

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []


  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self 
  end

  def say_species
    "I am a human."
  end

  def self.all 
    @@all
  end

  def self.count
    self.all.count #self.all calls the method to return the @all array, count method used on array to get the number of elements
  end

  def self.reset_all
    self.all.clear #self.all called again. Clear used on the array to clear all elements
  end

  def cats
    #Cat.all #this will give us the total array of cats

    #self.name #this will give us the name of the owner
    
    Cat.all.select {|cat| cat.owner == self}

  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    all_pets = cats + dogs
    all_pets.each {|pets| pets.mood = "nervous"}
    all_pets.each {|pets| pets.owner = nil}
  end  
  
  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end


