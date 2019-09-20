require_relative "./owner.rb"
# for now we don't need this 
# because it is set up for the environment, but later we will need this

class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all_cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all_cats << self
  end

  def self.all
    @@all_cats
  end

end