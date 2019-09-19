require "pry"

class Owner

  @@owners = []

  attr_reader :name, :species

  ## express relationship in one class not both

  def initialize(name)
    @name = name 
    @species = "human"
    @@owners << self
  end

  def say_species
    return "I am a human."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.count
  end

  def self.reset_all
    @@owners = []
  end
    
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end 
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Dog.all.select do |dog|
      dog.mood = "nervous"
    end

    Dog.all.select do |dog|
      dog.owner = nil
    end

    Cat.all.select do |cat|
      cat.mood = "nervous"
    end

    Cat.all.select do |cat|
      cat.owner = nil 
    end

  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end