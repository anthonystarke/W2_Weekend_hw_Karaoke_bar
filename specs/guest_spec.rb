require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../bar.rb')
require_relative('../drink.rb')

class Minitest::Test

  def setup

    @drink_details_1 = {
      name: "Whiskey",
      price: 2,
      alcohol_percent: 40
    }
    @drink_details_2 = {
      name: "Wine",
      price: 2,
      alcohol_percent: 40
    }

    @guest = Guest.new("John",21,140,"Eye of the Tiger")
    @bar = Bar.new(20)
    @drink_1 = Drink.new(@drink_details_1)
    @drink_2 = Drink.new(@drink_details_2)
    @bar.add_drink_to_bar(@drink_1)
    @bar.add_drink_to_bar(@drink_2)

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

  def test_buy_a_drink
    @guest.buy_a_drink(@bar,"Whiskey")
    assert_equal(138, @guest.get_money_left)
  end

  def test_return_guest_has_drink__true
    @guest.buy_a_drink(@bar,"Whiskey")
    assert_equal(true, @guest.has_drink)
  end

  def test_return_guest_has_drink__false
    assert_equal(false, @guest.has_drink)
  end

end
