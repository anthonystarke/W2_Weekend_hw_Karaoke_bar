require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')

class Minitest::Test

  def setup

    @drink_details = {
      name: "Whiskey",
      price: 2,
      alcohol_percent: 40
    }

    @bar = Bar.new(25)
    @drink_1 = Drink.new(@drink_details)
    @guest_1 = Guest.new("John",21,140,"Eye of the Tiger")
    @guest_2 = Guest.new("James",16,140,"Eye of the Tiger")

  end

  def test_drink_counter
    assert_equal(0,@bar.drinks_counter)
  end

  def test_add_drink_to_bar
    assert_equal(0,@bar.drinks_counter)
    @bar.add_drink_to_bar(@drink_1)
    assert_equal(1,@bar.drinks_counter)
  end

  def test_looking_for_drink
    @bar.add_drink_to_bar(@drink_1)
    assert_equal(@drink_1,@bar.look_for_drink("Whiskey"))
  end

  def test_sell_drink_by_name
    assert_equal(0,@bar.drinks_counter)
    @bar.add_drink_to_bar(@drink_1)
    assert_equal(1,@bar.drinks_counter)
    assert_equal(@drink_1,@bar.sell_drink_by_name("Whiskey",@guest_1))
  end

  def test_check_guest_age__true
    assert_equal(true, @bar.check_customer_age(@guest_1))
  end

  def test_check_guest_age__false
    assert_equal(false, @bar.check_customer_age(@guest_2))
  end

  def test_check_customer_can_afford_entry
      assert_equal(true,@bar.check_guest_can_afford(@guest_1))
  end

end
