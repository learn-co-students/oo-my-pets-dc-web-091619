class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
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
    Cat.all.select {|ele| ele.owner == self}
  end

  def dogs
    Dog.all.select {|ele| ele.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    new_dog
  end

  def walk_dogs
    self.dogs.map {|ele| ele.mood = "happy"}
  end

  def feed_cats
    self.cats.map {|ele| ele.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|ele| 
    ele.mood = "nervous"
    ele.owner = nil
  }
    self.cats.each {|ele| 
    ele.mood = "nervous"
    ele.owner = nil
  }
    self.dogs.clear
    self.cats.clear
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end