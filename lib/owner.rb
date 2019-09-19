class Owner
  
  attr_reader :name

  @@all=[]

  def initialize(name)
    @name = name
    @species = human
    @@all << self
  end

  def say_species
    @species
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all=[]
  end



end