class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def say_species
    return "I am a #{self.species}."
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
      cat if cat.owner == self}
  end
  
  def dogs
    Dog.all.select{|dog|
      dog if dog.owner == self}
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    dog = Dog.new(dog_name, self)
  end
  
  def walk_dogs
    Dog.all.each{|dog|
      dog.mood = "happy"}
  end
  
  def feed_cats
    Cat.all.each{|cat|
      cat.mood = "happy"}
  end

  def sell_pets
    all_pets = [Cat.all, Dog.all]
    all_pets.each{|type|
      type.each{|animal|
        animal.mood = "nervous"
        animal.owner = nil
      }}
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end