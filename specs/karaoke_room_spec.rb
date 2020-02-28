require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/karaoke_room.rb')
require_relative('../models/bar.rb')

class KaraokeRoomTest < MiniTest::Test

# Setup

  def setup
    @bar1 = Bar.new("Bar Bell")
    @karaoke_room1 = KaraokeRoom.new(@bar1, "Room 1", 5, 10, [])
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

end
