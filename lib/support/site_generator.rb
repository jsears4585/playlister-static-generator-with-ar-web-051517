require 'pry'

class SiteGenerator
  attr_accessor :rendered_path

  def initialize rendered_path
    @rendered_path = rendered_path
    FileUtils::mkdir_p 'tmp'
    FileUtils::mkdir_p 'tmp/_site'
    FileUtils::mkdir_p 'tmp/_site/artists'
    FileUtils::mkdir_p 'tmp/_site/genres'
    FileUtils::mkdir_p 'tmp/_site/songs'
  end

  def build_index
    path = "index.html"
    from_template = File.read("./app/views/#{path}.erb")
    erb = ERB.new(from_template)
    File.open("#{@rendered_path}/#{path}", "w+") do |file|
      file << erb.result(binding)
    end
  end

  def build_artists_index
    path = "artists/index.html"
    from_template = File.read("./app/views/#{path}.erb")
    erb = ERB.new(from_template)
    File.open("#{@rendered_path}/#{path}", "w+") do |file|
      file << erb.result(binding)
    end
  end

  def build_artist_page
    artists = Artist.all
    artists.each do |artist|
      @artist = artist
      path = "artists/#{artist.to_slug}.html"
      from_template = File.read("./app/views/artists/show.html.erb")
      erb = ERB.new(from_template)
      File.open("#{@rendered_path}/#{path}", "w+") do |file|
        file << erb.result(binding)
      end
    end
  end

  def build_genres_index
    path = "genres/index.html"
    from_template = File.read("./app/views/#{path}.erb")
    erb = ERB.new(from_template)
    File.open("#{@rendered_path}/#{path}", "w+") do |file|
      file << erb.result(binding)
    end
  end

  def build_genre_page
    genres = Genre.all
    genres.each do |genre|
      @genre = genre
      path = "genres/#{genre.to_slug}.html"
      from_template = File.read("./app/views/genres/show.html.erb")
      erb = ERB.new(from_template)
      File.open("#{@rendered_path}/#{path}", "w+") do |file|
        file << erb.result(binding)
      end
    end
  end

  def build_songs_index
    path = "songs/index.html"
    from_template = File.read("./app/views/#{path}.erb")
    erb = ERB.new(from_template)
    File.open("#{@rendered_path}/#{path}", "w+") do |file|
      file << erb.result(binding)
    end
  end

  def build_song_page
    songs = Song.all
    songs.each do |song|
      @song = song
      path = "songs/#{song.to_slug}.html"
      from_template = File.read("./app/views/songs/show.html.erb")
      erb = ERB.new(from_template)
      File.open("#{@rendered_path}/#{path}", "w+") do |file|
        file << erb.result(binding)
      end
    end
  end
end
