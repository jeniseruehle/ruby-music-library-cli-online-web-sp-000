require 'pry'
class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    genre = self.new(name) 
    genre.save
    genre 
  end 
end 