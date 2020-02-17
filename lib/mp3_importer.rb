class MP3Importer

  attr_accessor :path
  @@files = []

  def initialize(path)
    @path = path
  end

  def save_filenames
    Dir.foreach(self.path) {|file| @@files << file if file.include?(".mp3")}
  end

  def files
    save_filenames
    @@files
  end

  def import
    @@files.each {|file| song = Song.new_by_filename(file)}
  end

end
