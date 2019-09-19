require "pry"
require_relative "./cat"
require_relative "./dog"

class Owner

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a human."
  end

  def self.all

    @@all

  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats

    Cat.all.select{|cat| 
      cat.owner == self
    } 

  end

  def dogs

    Dog.all.select{|dog| 
      dog.owner == self
    } 

  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each{|dog| dog.mood = "happy" if dog.owner == self}
  end

  def feed_cats
    Cat.all.each{|cat| cat.mood = "happy" if cat.owner == self} 
  end

  def sell_pets

    allpets = cats + dogs

    allpets.each{|pet| pet.mood = "nervous"}
    allpets.each{|pet| pet.owner = nil}

  end

  def list_pets

    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."

  end

end