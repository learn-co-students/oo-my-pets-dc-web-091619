require "pry"

class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood
  
  @@all_dogs = []

  def initialize(name, owner)
    @name = name 
    @owner = owner
    @mood = "nervous"
    @@all_dogs << self 
  end

  def self.all
    @@all_dogs
  end

  def self.reset_all
    self.all.clear
  end

end