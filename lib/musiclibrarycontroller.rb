class MusicLibraryController
  extend Concerns::Findable
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.chomp
      case input  
        when 'list songs' 
          list_songs 
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song 
      end 
    end 
  end

  def sort(klass)
    klass.all.sort_by { |i| i.name }
  end

  def list_songs
    sort(Song).each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sort(Artist).each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    sort(Genre).each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  # def list_songs_by_artist
  #   puts "Please, enter the name of an artist:"
  #   input = gets.chomp
  #   if artist = Artist.find_by_name(input)
  #     sorted_songs = artist.songs.sort_by { |song| song.name }

  # def list_songs
  #   # sorted_songs = Song.all.sort_by { |song| song.name }
  #   sort(Song).each.with_index(1) do |song, index|
  #     puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  #   end
  # end

  # def list_artists
  #   sorted_artists = Artist.all.sort_by { |artist| artist.name }
  #   sorted_artists.each.with_index(1) do |artist, index|
  #     puts "#{index}. #{artist.name}"
  #   end
  # end

  # def list_genres
  #   sorted_genres = Genre.all.sort_by { |genre| genre.name }
  #   sorted_genres.each.with_index(1) do |genre, index|
  #     puts "#{index}. #{genre.name}"
  #   end
  # end
end