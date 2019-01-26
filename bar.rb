class Bar

  attr_reader :total_money

  def initialize(entry_fee)
    @drinks_in_bar = []
    @total_money = 0
    @entry_fee = entry_fee
    @rooms_in_bar = []
    @guests_in_bar = []
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

  def check_guest_can_afford(new_guest)
    if new_guest.get_money_left > @entry_fee
      return true
    end
    return false
  end

  def check_customer_age(guest)
    if guest.age > 18
      return true
    else
      return false
    end
  end

  def rooms_in_bar_counter
    return @rooms_in_bar.count
  end

  def room_capacity_check(room)
    return room.capacity
  end

  def add_room_to_bar(room)
    @rooms_in_bar << room
  end

  def sell_drink_by_name(drink_name, guest)
    if check_customer_age(guest)
      found_drink = @drinks_in_bar.find{|drink| drink.get_drink_name() == drink_name}
      return @drinks_in_bar.delete(found_drink)
    end
  end

  def how_many_empty_rooms
    empty_rooms = @rooms_in_bar.find_all {|room| room.guests_in_room_checker == 0}
    return empty_rooms.count
  end

  def how_many_rooms_with_spaces
    room_with_space = @rooms_in_bar.find_all {|room| room.room_has_space }
    return room_with_space.count
  end

  def find_room_with_space
    room_with_space = @rooms_in_bar.find {|room| room.room_has_space }
    return room_with_space
  end

  def charge_entry_fee(guest)
    guest.reduce_money(@entry_fee)
    total_money += @entry_fee
  end

  def return_all_rooms
    return @rooms_in_bar
  end

  def remove_room(room)
    @rooms_in_bar.delete(room)
  end

  def take_customer_money(amount)
    @total_money += amount
  end

end
