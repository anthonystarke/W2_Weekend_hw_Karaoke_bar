require_relative('./bar.rb')
require_relative('./drink.rb')
require_relative('./guest.rb')
require_relative('./song.rb')
require_relative('./room.rb')


def start_initialize()
  @room_array = []

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

  def create_a_room()
    p "How many people do you want to allow in?"
    room_capacity = gets.chomp()
    return if room_capacity.empty?
    @room_array[@room_array.count()] = Room.new(room_capacity,0)
    @bar.add_room_to_bar(@room_array[@room_array.count()-1])
  end

  def delete_a_room()
    @bar.return_all_rooms.each_with_index do |room,index|
      p "Option: #{index+1} has #{room.capacity} capacity and #{room.capacity.to_i - room.guests_in_room_checker.to_i} Available slots"
    end
    if @bar.rooms_in_bar_counter >= 2
      p "Which room would you like to delete"
      key_input = gets.chomp()
      @bar.return_all_rooms.each_with_index do |room,index|
        p "#{index+1} Delete Room #{index+1}"
      end


    elsif @bar.rooms_in_bar_counter == 1
      p "1: To delete the this room"
      p "Q: To return to main menu"
      key_input = gets.chomp()

      case key_input
      when "1"
        @bar.remove_room(@room_array[0])
        @room_array.clear()
      when "q"
        return
      end
    else
      p "No rooms to delete returning back to Main menu"
    end

  end

def main_loop()
  system "clear"
  p "Welcome to Karaoke"
  p "Type quit to Exit/leave"

  key_input = ""

  while(key_input != "quit")
    p "Below is your Bar's details"
    p "#{@bar.rooms_in_bar_counter()} Rooms"

    if @bar.rooms_in_bar_counter > 0
      @bar.return_all_rooms.each_with_index do |room,index|
        p "Room: #{index+1} has #{room.capacity} capacity and #{room.capacity.to_i - room.guests_in_room_checker.to_i} Available slots"
      end
    end

    p "#{@bar.total_money} Money"
    puts ""
    p "Choose an option"
    p "1: Create a room"
    p "2: Delete a room"

    key_input = gets.chomp().downcase()

    case key_input
    when "1"
      create_a_room()
    when "2"
      delete_a_room()
    else
    end

  end

end

start_initialize()
main_loop()
