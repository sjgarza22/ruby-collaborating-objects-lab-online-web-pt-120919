class Song

  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    song_info = filename.split(" - ")
    song = self.new(song_info[1])
    song.artist_name = song_info[0]
  end

  def artist_name=(name)
    if Artist.find_by_name(name) != nil
      self.artist = Artist.find_by_name(name)
    else
      artist = Artist.new(name)
      self.artist = artist
    end
  end
end
