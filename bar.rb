class Bar

  def initialize
    @drinks_in_bar = []
    @total_money = 0
  end

  def add_drink_to_bar(drink)
    @drinks_in_bar << drink
  end

  def drinks_counter
    return @drinks_in_bar.count
  end

  def look_for_drink(drink_name)
    return @drinks_in_bar.find{|drink| drink.get_drink_name() == drink_name}
  end

  def check_customer_age(guest)
    if guest.age > 18
      return true
    else
      return false
    end
  end

  def sell_drink_by_name(drink_name, guest)
    if check_customer_age(guest)
      found_drink = @drinks_in_bar.find{|drink| drink.get_drink_name() == drink_name}
      return @drinks_in_bar.delete(found_drink)
    end
  end

  def take_customer_money(amount)
    @total_money += amount
  end

end
