class Guest

  attr_reader :name, :age, :favourite_song
  attr_accessor :wallet, :current_room, :current_mood

  def initialize(name, age, wallet, favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
    @current_room = "#{self.name} is not in any karaoke room."
    @current_mood = "Neutral"
  end

# Get Information

  def my_age()
    return "#{self.name} is #{@age} years old."
  end

  def my_wallet()
    return "#{self.name} is carrying £#{self.wallet}."
  end

  def my_favourite_song()
    return "#{self.name}'s favourite song is #{@favourite_song.name}."
  end

# Actions

  def enter(room)
    @current_room = room
    if room.song_list.include?(@favourite_song)
      @current_mood = "Happy"
    end
  end

  def exit()
    @current_room = "#{self.name} is not in any karaoke room."
    @current_mood = "Neutral"
  end

  def sing()
    if @current_room.class == KaraokeRoom
      if @current_mood == "Happy"
        return "My favourite song is playing! Time for my #{@favourite_song.length_seconds} seconds in the limelight."
      else
        return "I don't really like the songs here."
      end
    else
      return "I can't sing here!"
    end
  end

end
