class Bar

  attr_reader :name, :karaoke_rooms
  attr_accessor :till

  def initialize(name, karaoke_rooms)
    @name = name
    @karaoke_rooms = []
    @till = 0
  end

end
