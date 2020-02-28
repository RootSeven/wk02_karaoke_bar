require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/bar.rb')

class BarTest < MiniTest::Test

  def setup()
    @bar1 = Bar.new("Bar Bell")
  end

  def test_get_name()
    assert_equal("Bar Bell", @bar1.name)
  end

end
