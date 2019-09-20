require "pry"
require_relative './dog.rb'
require_relative './cat.rb'

class Owner
  
  attr_reader :name, :species

  @@all= []

def initialize (name)
  @name=name
  @species= "human"
  @@all <<self
  
end


def say_species
  "I am a #{@species}."
  #or best practice is "I am a #{self.species}" the self species is from the attr reader
end

def self.all
@@all
end

def self.count
self.all.length
#  @@all.length also works
end


def self.reset_all
# self.all.clear works as well
@@all.clear
#or @@all=[]
#self.all.clear is better to use
end

def cats
  Cat.all.select do |cat|
  cat.owner==self
end
end

def dogs
  Dog.all.select do |dog|
  dog.owner==self

  # OR 
  #Dog.all.select do |dog|
  #dog if dog.owner==self
  #select reads the last line, no need to explicitly say return because ruby automatically returns last line

  #or can do:
  # if dog.owner==self
  #dog (return dog)
  end
end

def buy_cat(name)
Cat.new(name,self)
end

def buy_dog(name)
  Dog.new(name,self)
end

def walk_dogs
  dogs.map do |dog|
    dog.mood="happy"

    #or do:
    #self.dogs
  end
end

def feed_cats
cats.map do |cat|
  cat.mood="happy"
  end
end

def sell_pets
  all_pets=self.dogs.concat(self.cats)
  all_pets.map do |pet|
  pet.mood="nervous"
  pet.owner=nil
  end
end

def list_pets

  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  
  # all_pets=self.dogs.concat(self.cats)
  # all_pets.map do |pet|
  # pet.owner==self
end

end

# binding.pry
0