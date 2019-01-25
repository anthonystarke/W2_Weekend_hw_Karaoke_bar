require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class Minitest::Test

  def setup

    drink_details = {
      name: "Whiskey",
      price: 2,
      alcohol_percent: 40
    }

    @drink = Drink.new(drink_details)

  end

  def test_get_drink_name
    assert_equal("Whiskey",@drink.get_drink_name)
  end

  def test_get_drink_price
    assert_equal(2,@drink.get_drink_price)
  end

  def test_drink_alcohol_percent
    assert_equal(40,@drink.get_alcohol_percent)
  end

end
