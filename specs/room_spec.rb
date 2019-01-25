require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class Minitest::Test

  def setup

    @room = Room.new(8,25)
    @guest_1 = Guest.new("Johny",25,100,"My Way")
    @song = Song.new("My Way")
  end

  def test_room_capacity
    assert_equal(8,@room.capacity)
  end

  def test_entry_fee
    assert_equal(25,@room.entry_fee)
  end

  def test_change_entry_fee
    @room.change_entry_fee(20)
    assert_equal(20,@room.entry_fee)
  end

  def test_number_of_songs_in_room
    # @room.add_song_to_playlist(@song)
    assert_equal(0,@room.number_of_songs)
  end

  def test_add_song_to_playlist
    @room.add_song_to_playlist(@song)
    assert_equal(1,@room.number_of_songs)
  end

  def test_return_all_playlist_songs
    list = ["Jonny Boy","CATS"]
    @room.add_song_to_playlist("Jonny Boy")
    @room.add_song_to_playlist("CATS")

    assert_equal(list,@room.return_all_songs)
  end

  def test_clear_playlist
    @room.add_song_to_playlist("Jonny Boy")
    @room.add_song_to_playlist("CATS")
    @room.clear_playlist()
    assert_equal(0,@room.number_of_songs)
  end

  def test_room_capacity__with_customer
    @room.check_guest_in(@guest_1)
    assert_equal(1,@room.guests_in_room_checker)
  end

  def test_guest_can_affort
    assert_equal(true, @room.check_guest_can_afford(@guest_1))
  end

  def test_room_total_money
    @room.check_guest_in(@guest_1)
    assert_equal(25,@room.return_total_money)
  end

  def test_remove_guest_from_room
    @room.check_guest_in(@guest_1)
    @room.check_out_guest(@guest_1)
    assert_equal(0,@room.guests_in_room_checker)
  end

  def test_check_customer_fav_song
    @room.add_song_to_playlist(@song)
    assert_equal("WHoo",@room.check_guest_in(@guest_1))
  end

  def test_room_capacity_vs_guest_count
    
  end


end