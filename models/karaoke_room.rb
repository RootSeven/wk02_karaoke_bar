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
    if enough_room() && guest.wallet >= @entry_fee
      @guests_in_room.push(guest)
      guest.wallet -= @entry_fee
      self.bar.till += @entry_fee
      guest.enter(self)
    end

    if not enough_room()
      return "There is no more space in this room."
    else
      return "You do not have enough money to book this room"
    end
  end

  def remove_guest(guest)
    if self.guests_in_room.include?(guest)
      self.guests_in_room.delete(guest)
      guest.exit()
    else
      return "#{guest.name} is not in this room."
    end
  end

  def enough_room()
    if @guests_in_room.length < @capacity
      return true
    else
      return false
    end
  end

end
