class Song

  attr_reader :name, :artist, :length_seconds

  def initialize(name, artist, length_seconds)
    @name = name
    @artist = artist
    @length_seconds = length_seconds
  end

end
