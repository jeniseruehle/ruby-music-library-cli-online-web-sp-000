require 'pry'
class Song 
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre 
  attr_reader :songs
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @artist = artist
    @genre = genre
    @songs = []
  end 
  
  def self.all 
    @@all.uniq 
  end 
  
  def self.destroy_all
    @@all = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 

  def self.new_from_filename(filename)
    array = filename.split(" - ")

    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
end 