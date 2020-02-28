require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/bar.rb')

class BarTest < MiniTest::Test

  def setup()
    @karaoke_room1 = KaraokeRoom.new(@bar1, "Room 1", 5, 10, [])
    @bar1 = Bar.new("Bar Bell", [@karaoke_room1])
  end

  def test_get_name()
    assert_equal("Bar Bell", @bar1.name)
  end

end
