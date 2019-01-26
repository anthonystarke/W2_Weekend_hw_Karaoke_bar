require('minitest/autorun')
require('minitest/rg')
require_relative('../bar.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class Minitest::Test

  def setup

    @guest_1 = Guest.new("James",34,100,"One more Time")
    @guest_2 = Guest.new("Sarah",28,100,"Let's dance")
    @guest_3 = Guest.new("Clair",41,100,"Up Up")
    @song_1 = Song.new("One more Time")
    @song_2 = Song.new("Let's dance")
    @song_3 = Song.new("Up Up")

    drink_1_details = {
      name: "Wine",
      price: 3,
      alcohol_percent: 3
    }

    drink_2_details = {
      name: "Beer",
      price: 4,
      alcohol_percent: 5
    }

    drink_3_details = {
      name: "Cider",
      price: 3,
      alcohol_percent: 3
    }

    @drink_1 = Drink.new(drink_1_details)
    @drink_2 = Drink.new(drink_2_details)
    @drink_3 = Drink.new(drink_3_details)

    @bar = Bar.new(25)
    @room_1 = Room.new(2,0)
    @room_2 = Room.new(4,0)
    @room_3 = Room.new(6,0)

    @bar.add_drink_to_bar(@drink_1)
    @bar.add_drink_to_bar(@drink_2)
    @bar.add_drink_to_bar(@drink_3)

    @room_1.add_song_to_playlist(@song_1)
    @room_2.add_song_to_playlist(@song_2)
    @room_3.add_song_to_playlist(@song_3)

  end

  def test_bar_room_counter__0
    assert_equal(0,@bar.rooms_in_bar_counter)
  end

  def test_bar_room_counter__2
    @bar.add_room_to_bar(@room_1)
    @bar.add_room_to_bar(@room_2)
    assert_equal(2,@bar.rooms_in_bar_counter)
  end

  def test_room_capacity
    assert_equal(2,@bar.room_capacity_check(@room_1))
  end

  def test_look_for_empty_room__count
    @bar.add_room_to_bar(@room_1)
    @bar.add_room_to_bar(@room_2)
    assert_equal(2,@bar.how_many_empty_rooms())
  end

  def test_look_for_space_in_room__return_room
    @bar.add_room_to_bar(@room_1)
    @room_1.check_guest_in(@guest_1)
    @room_1.check_guest_in(@guest_2)

    @bar.add_room_to_bar(@room_2)
    assert_equal(@room_2,@bar.find_room_with_space())
  end

end
