class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name= name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap { |genre| genre.save }
  end

  def songs
    @songs
  end 

def artists
  @artists = []
  self.songs.collect do |song|
    @artists << song.artist unless @artists.include?(song.artist)
end
@artists
end

  
end