class Owner
  attr_reader :name, :species
  # attr_reader only gets a instance,
  # but doesn't make a writter so it cannot be overwritted
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self              # self is an instance object here
  end

  def say_species
    "I am a #{self.species}."  # we used self.species here because if you do just
  end                          # @species then it will not go throught the
                               # customized writter

  def self.all
    @@all
  end

  def self.count
    @@all.length  # could do self.all.length as well
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
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
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