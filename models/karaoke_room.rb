class KaraokeRoom

  attr_reader :bar, :name, :capacity, :entry_fee, :song_list

  def initialize(bar, name, capacity, entry_fee, song_list)
    @bar = bar
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @song_list = song_list
  end

end
