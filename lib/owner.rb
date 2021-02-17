require 'pry'
class Owner
  attr_reader :name, :species, :say_species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a human."
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    counter = 0
    self.all.collect do |owners|
      counter +=1
    end
    counter
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select{|dogs| dogs.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each do |dogs| 
      if dogs.owner == self
        dogs.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.each do |cats|
      if cats.owner == self
        cats.mood = "happy"
      end
    end
  end

  def sell_pets
    Dog.all.each do |dogs| 
      if dogs.owner == self
        dogs.mood = "nervous"
        dogs.owner = nil
      end
    end

    Cat.all.each do |cats|
      if cats.owner == self
        cats.mood = "nervous"
        cats.owner = nil
      end
    end

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end



end