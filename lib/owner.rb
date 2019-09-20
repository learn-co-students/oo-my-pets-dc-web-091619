require "pry"
class Owner
  
  attr_reader :name, :species
  
  @@all=[]

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a human."
  end

  def self.all #why not just all without self like in the dogs/cats?
    @@all
  end

  def self.count
    self.all.count #this calls the self.all method above and returns the count.
  end

  def self.reset_all
    #@@all=[]
    self.all.clear #use self.all for one single point of truth.  .clear is easier to read and defines a purpose.
  end

  def cats 
    Cat.all.select{|cats|cats.owner == self}
  end

  def dogs
    Dog.all.select{|dogs|dogs.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name,self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name,self)
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
    binding.pry
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end