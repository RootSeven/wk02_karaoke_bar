require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/karaoke_room.rb')
require_relative('../models/bar.rb')
require_relative('../models/song.rb')
require_relative('../models/guest.rb')

class KaraokeRoomTest < MiniTest::Test

# Setup

  def setup
    @bar1 = Bar.new("Bar Bell", [@karaoke_room1])

    @karaoke_room1 = KaraokeRoom.new(@bar1, "Room 1", 5, 10, [])
    @karaoke_room2 = KaraokeRoom.new(@bar1, "Room 2", 1, 5, [])

    @song1 = Song.new("Careless Whisper", "George Michael", 390)
    @song2 = Song.new("Dancing Queen", "ABBA", 232)

    @guest1 = Guest.new("Oleander", 25, 100, @song1)
    @guest2 = Guest.new("Andre", 23, 130, @song2)
  end

# Getter tests

  def test_get_bar()
    assert_equal("Bar Bell", @karaoke_room1.bar.name)
  end

  def test_get_name()
    assert_equal("Room 1", @karaoke_room1.name)
  end

  def test_get_capacity()
    assert_equal(5, @karaoke_room1.capacity)
  end

  def test_get_entry_fee()
    assert_equal(10, @karaoke_room1.entry_fee)
  end

  def test_get_songs_list()
    assert_equal([], @karaoke_room1.song_list)
  end

# Method Tests

  def test_add_song()
    @karaoke_room1.add_song(@song1)
    assert_equal([@song1], @karaoke_room1.song_list)
  end

  def test_add_guest()
    @karaoke_room1.add_guest(@guest1)
    assert_equal([@guest1], @karaoke_room1.guests_in_room)
    assert_equal(90, @guest1.wallet)
    assert_equal(@karaoke_room1, @guest1.current_room)
    assert_equal(@karaoke_room1, @guest1.current_room)
    assert_equal(10, @karaoke_room1.bar.till)
  end

  def test_enough_room__true()
    assert_equal(true, @karaoke_room1.enough_room)
  end

  def test_enough_room__false()
    @karaoke_room2.add_guest(@guest1)
    assert_equal(false, @karaoke_room2.enough_room)
  end

  def test_remove_guest()
    @karaoke_room1.add_guest(@guest1)
    @karaoke_room1.add_guest(@guest2)
    assert_equal(@karaoke_room1, @guest1.current_room)
    assert_equal(@karaoke_room1, @guest2.current_room)
    assert_equal([@guest1, @guest2], @karaoke_room1.guests_in_room)

    @karaoke_room1.remove_guest(@guest2)
    assert_equal(@karaoke_room1, @guest1.current_room)
    assert_equal("Andre is not in any karaoke room.", @guest2.current_room)
    assert_equal([@guest1], @karaoke_room1.guests_in_room)

    assert_equal("Andre is not in this room.", @karaoke_room1.remove_guest(@guest2))
    assert_equal("Oleander is not in this room.", @karaoke_room2.remove_guest(@guest1))
  end

end
