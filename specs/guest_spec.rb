require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/guest.rb')

class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Oleander", 25, 100, "Careless Whisper")
  end

  def test_get_name()
    assert_equal("Oleander", @guest1.name)
  end

  def test_get_age()
    assert_equal(25, @guest1.age)
  end

  def test_get_wallet()
    assert_equal(100, @guest1.wallet)
  end

  def test_get_favourite_song()
    assert_equal("Careless Whisper", @guest1.favourite_song)
  end

end
