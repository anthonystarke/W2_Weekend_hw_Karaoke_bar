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

    @guest_1 = Guest.new("John",30,200,"Yeah Yeah Yeah")
    @room_1 = Room.new(5,0)
    @song_1 = Song.new("Yeah Yeah Yeah")
    @display = Display.new()

  end

  def test_display_room_capacity
    assert_equal(5,@display.display_room_capacity(@room_1))
  end

  def test_display_numbner_of_guests_in_room
    @room_1.check_guest_in(@guest_1)
    assert_equal(1,@display.display_num_guest_in_room(@room_1))
  end

  def test_display_guests_in_room
    @room_1.check_guest_in(@guest_1)
    new_array = []
    new_array << @guest_1
    assert_equal(new_array,@display.display_guests_in_room(@room_1))
  end

  def test_display_playlist__count
    @room_1.add_song_to_playlist(@song_1)
    assert_equal(1,@display.display_playlist_count(@room_1))
  end

  def test_display_playlist__list
    @room_1.add_song_to_playlist(@song_1)
    new_array = []
    new_array << "Yeah Yeah Yeah"
    assert_equal(new_array,@display.display_playlist_list(@room_1))
  end


end
