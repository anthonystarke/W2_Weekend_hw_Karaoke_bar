require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../bar.rb')
require_relative('../drink.rb')
require_relative('../display.rb')
require_relative('../room.rb')

class Minitest::Test

  def setup

    @room_1 = Room.new(5,0)
    @display = Display.new()

  end

  def test_display_room_capacity
    assert_equal("5",@display.display_room_capacity(@room_1))
  end

end
