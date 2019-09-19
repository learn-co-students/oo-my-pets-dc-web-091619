class Dog

  @@dogs = []

  attr_reader :name
  attr_accessor :owner, :mood

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner 
    @mood = mood
    @@dogs << self
  end

  def self.all
    @@dogs 
  end

end