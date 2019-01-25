require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')

class Minitest::Test

  def setup
    @guest = Guest.new("John",21,140,"Eye of the Tiger")
  end

  def test_guest_name
    assert_equal("John",@guest.name)
  end

  def test_guest_age
    assert_equal(21,@guest.age)
  end

  def test_get_favourite_song
    assert_equal("Eye of the Tiger",@guest.get_favourite_song())
  end

  def test_guest_money
    assert_equal(140,@guest.get_money_left())
  end

  def test_guest_give_money
    @guest.reduce_money(40)
    assert_equal(100,@guest.get_money_left())
  end

  def test_fav_song
    list = []
    @song = Song.new("Eye of the Tiger")
    list << @song
    assert_equal("WHoo", @guest.check_for_fav_song(list))
  end

end
