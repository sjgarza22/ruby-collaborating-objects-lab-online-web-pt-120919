class Artist

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def songs
    Song.all.select {|song| song.artist == self}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      artist = self.find_by_name(name)
    else
      artist = self.new(name)
    end

    artist
  end

  def print_songs
    Song.all.each {|song| puts song.name if song.artist == self}
  end
end
