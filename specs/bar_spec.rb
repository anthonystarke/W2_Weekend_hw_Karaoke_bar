require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../drink.rb')

class Minitest::Test

  def setup

    @drink_details = {
      name: "Whiskey",
      price: 2,
      alcohol_percent: 40
    }

    @bar = Bar.new()
    @drink_1 = Drink.new(@drink_details)

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
    assert_equal(@drink_1,@bar.sell_drink_by_name("Whiskey"))
  end

end
