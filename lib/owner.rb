class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a human."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(new_cat)
    Cat.new(new_cat,self)
  end

  def buy_dog(new_dog)
    Dog.new(new_dog,self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end
    
  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    (dogs+cats).each do |pet| 
      pet.mood = "nervous" 
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end