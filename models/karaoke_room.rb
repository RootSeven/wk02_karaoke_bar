class KaraokeRoom

  attr_reader :bar, :name, :capacity, :entry_fee, :song_list, :guests_in_room

  def initialize(bar, name, capacity, entry_fee, song_list)
    @bar = bar
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @song_list = song_list
    @guests_in_room = []
  end

  def add_song(song)
    @song_list.push(song)
  end

  def add_guest(guest)
    @guests_in_room.push(guest)
  end

  def enough_room()
    if @guests_in_room.length < @capacity
      return true
    else
      return false
    end
  end

end
