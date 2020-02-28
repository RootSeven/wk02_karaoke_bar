require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/song.rb')

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Careless Whisper", "George Michael", 390)
  end

# Getter Tests

  def test_get_name()
    assert_equal("Careless Whisper", @song1.name)
  end

  def test_get_artist()
    assert_equal("George Michael", @song1.artist)
  end

  def test_get_length_seconds()
    assert_equal(390, @song1.length_seconds)
  end

end
