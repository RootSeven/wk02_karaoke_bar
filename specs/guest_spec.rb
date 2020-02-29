require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/guest.rb')
require_relative('../models/karaoke_room.rb')
require_relative('../models/bar.rb')
require_relative('../models/song.rb')

class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("Careless Whisper", "George Michael", 390)

    @guest1 = Guest.new("Oleander", 25, 100, @song1)

    @karaoke_room1 = KaraokeRoom.new(@bar1, "Room 1", 5, 10, [])

    @bar1 = Bar.new("Bar Bell", [@karaoke_room1])
  end

# Getter Tests

  # def test_get_name()
  #   assert_equal("Oleander", @guest1.name)
  # end
  #
  # def test_get_age()
  #   assert_equal(25, @guest1.age)
  # end
  #
  # def test_get_wallet()
  #   assert_equal(100, @guest1.wallet)
  # end
  #
  # def test_get_favourite_song()
  #   assert_equal("Careless Whisper", @guest1.favourite_song.name)
  # end
  #
  # def test_get_current_room()
  #   assert_equal("Oleander is not in any karaoke room.", @guest1.current_room)
  # end

# Get Information Tests

  def test_my_favourite_song()
    assert_equal("Oleander's favourite song is Careless Whisper.", @guest1.my_favourite_song())
  end

  def test_my_age()
    assert_equal("Oleander is 25 years old.", @guest1.my_age)
  end

  def test_my_wallet()
    assert_equal("Oleander is carrying £100.", @guest1.my_wallet)
  end

# Action Tests

  def test_enter_room__favourite_song_happy()
    @karaoke_room1.add_song(@song1)
    @guest1.enter(@karaoke_room1)
    assert_equal(@karaoke_room1, @guest1.current_room)
    assert_equal("Happy", @guest1.current_mood)
  end

  def test_enter_room__not_favourite_song_neutral()
    @guest1.enter(@karaoke_room1)
    assert_equal(@karaoke_room1, @guest1.current_room)
    assert_equal("Neutral", @guest1.current_mood)
  end

  def test_exit()
    @guest1.enter(@karaoke_room1)
    @guest1.exit()

    assert_equal("Oleander is not in any karaoke room.", @guest1.current_room)
    assert_equal("Neutral", @guest1.current_mood)
  end

  def test_sing()
    assert_equal("Oleander is not in any karaoke room.", @guest1.current_room)
    assert_equal("I can't sing here!", @guest1.sing())

    @guest1.enter(@karaoke_room1)
    assert_equal([], @karaoke_room1.song_list)
    assert_equal("I don't really like the songs here.", @guest1.sing())
    @guest1.exit()
    assert_equal("Oleander is not in any karaoke room.", @guest1.current_room)

    @karaoke_room1.add_song(@song1)
    @guest1.enter(@karaoke_room1)
    assert_equal([@song1], @karaoke_room1.song_list)
    assert_equal("Happy", @guest1.current_mood)
    assert_equal("My favourite song is playing! Time for my 390 seconds in the limelight.", @guest1.sing())

  end

end
