class Drink

  def initialize(drink_details)
    @drink_details = drink_details
  end

  def get_drink_name
    return @drink_details[:name]
  end

  def get_drink_price
    return @drink_details[:price]
  end

  def get_alcohol_percent
    return @drink_details[:alcohol_percent]
  end

end
