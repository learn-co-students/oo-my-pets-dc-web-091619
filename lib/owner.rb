require "pry"

class Owner
  attr_reader :name, :species
  attr_accessor :cats, :dogs

  #___CLASS METHODS

  @@all = []

  def self.all 
    @@all
  end

  def self.count 
    @@all.size
  end

  def self.reset_all 
    @@all.clear
  end

  #___INSTANCE METHODS 

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []


    @@all << self
  end

  def say_species 
    return "I am a #{self.species}."
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end
  
  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats 
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    if cats.size > 0
      cats.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    if dogs.size > 0 
      dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end
    end

    cats.clear
    dogs.clear
  end

  def list_pets 
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end