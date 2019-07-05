class Artist  
  extend Concerns::Findable
  attr_accessor :name 
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
    self.new(name).tap { |artist| artist.save }
  end
end
 
 def songs 
    @songs 
  end
  
  def add_song(song)
    if song.artist == self 
    self.songs << song unless self.songs.include?(song) 
  else 
    song.artist = self 
    self.songs << song unless self.songs.include?(song)
  end
end

  def genres
    songs.map { |song| song.genre }.uniq
  end 

end