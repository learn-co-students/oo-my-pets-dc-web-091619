require "pry"

class Cat
  
  @@all = []

  attr_reader :name
  attr_accessor :owner, :mood
# just because create instance vars, doesn't mean they can be "exposed", so have to also create attr_reader/accessor/writer or write out an explicit method below

# name and owner are the only vars set as parameters for initialize method because that's what instructions specify
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  # need to always push every instance of cat/dog/etc into self so that it gets added to the array above
  end

  def self.all
    @@all
  end

end