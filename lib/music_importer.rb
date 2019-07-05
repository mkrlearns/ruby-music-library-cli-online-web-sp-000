class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
   def files
   Dir.chdir(@path) { |file|
        Dir.glob("*.mp3")
  end
end
  
  def import
    self.files.each do |file|
    Song.create_from_filename(file)
  end
end
  
end