require_relative('./bar.rb')
require_relative('./drink.rb')
require_relative('./guest.rb')
require_relative('./song.rb')
require_relative('./room.rb')


  def start_initialize()
    @room_array = []
    @guests_in_queue_array = []
    @songs_in_queue_array = []

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
    @room_1 = Room.new(2)
    @room_2 = Room.new(4)
    @room_3 = Room.new(6)

    @bar.add_drink_to_bar(@drink_1)
    @bar.add_drink_to_bar(@drink_2)
    @bar.add_drink_to_bar(@drink_3)

    @room_1.add_song_to_playlist(@song_1)
    @room_2.add_song_to_playlist(@song_2)
    @room_3.add_song_to_playlist(@song_3)
  end

  def create_a_room()
    system "clear"
    p "Creating a new room:"
    p "List of Rooms available"
    @bar.return_all_rooms.each_with_index do |room,index|
      p "Room: #{index+1} has #{room.capacity} capacity and #{room.capacity.to_i - room.guests_in_room_checker.to_i} Available slots"
    end
    p "How many people do you want to allow in to this room?"
    room_capacity = gets.chomp()
    return if room_capacity.empty?
    # @room_array[@room_array.count()] = Room.new(room_capacity,0)
    new_room = Room.new(room_capacity)
    @bar.add_room_to_bar(new_room)
  end

  def delete_a_room()
    system "clear"
    p "Deleting room - only 1 at a time"
    @bar.return_all_rooms.each_with_index do |room,index|
      p "Option: #{index+1} has #{room.capacity} capacity and #{room.capacity.to_i - room.guests_in_room_checker.to_i} Available slots"
    end

    if @bar.rooms_in_bar_counter >= 2
      p "Which room would you like to delete"
      @bar.return_all_rooms.each_with_index do |room,index|
        p "Press #{index+1} to Delete Room #{index+1}"
      end

      key_input = gets.chomp()
      @room_array = @bar.return_all_rooms()
      @bar.remove_room(@room_array[(key_input.to_i)-1])
      @room_array.delete((key_input.to_i)-1)

    elsif @bar.rooms_in_bar_counter == 1
      p "1: To delete the this room"
      p "Q: To return to main menu"
      key_input = gets.chomp()

      case key_input
      when "1"
        room_to_delete = @bar.return_all_rooms()
        @bar.remove_room(room_to_delete[0])

      when "q"
        return
      end
    else
      p "No rooms to delete returning back to Main menu"
    end

  end

  def create_a_guest()

    system "clear"
    p "Creating a guest: "
    p "Lets choose a name "
    name = gets.chomp()
    system "clear"
    p "How old is #{name}:"
    age = gets.chomp()
    system "clear"
    p "How much money is #{name} getting:"
    money = gets.chomp()
    system "clear"
    p "What is #{name}'s favourite song:"
    song = gets.chomp()
    new_guest = Guest.new(name,age,money,song)
    @guests_in_queue_array << new_guest
    system "clear"
    p "Exellent, your Guest has been created and added to the queue to go into the bar"
    p "Press Enter to go back to main menu"
    gets.chomp()
  end

  def create_a_song()
    system "clear"
    p "What will we call the song"
    song_name = gets.chomp()
    new_song = Song.new(song_name)
    @songs_in_queue_array << new_song
    system "clear"
    p "Song called --> '#{song_name}' has been created and added to the song queue to be added to a room"
    p "Press Enter to head back to main menu"
    gets.chomp()

  end

  def room_select_add(room)
    
  end

  def add_items_to_room()
    system "clear"
    p "#{@bar.rooms_in_bar_counter()} Rooms"
    if @bar.rooms_in_bar_counter > 0
      @bar.return_all_rooms.each_with_index do |room,index|
        p "Room: #{index+1} has #{room.capacity} capacity and #{room.capacity.to_i - room.guests_in_room_checker.to_i} Available slots"
      end
    else
      p "No rooms created, head back and make some - Press Enter to head back"
    end
    p "Choose room"
    key_input = gets.chomp()
  end

def main_loop()
  system "clear"
  p "Welcome to Karaoke"
  p "Type quit to Exit/leave"

  key_input = ""

  while(key_input != "quit")
    system "clear"
    p "Below is your Bar's details"
    p "#{@bar.rooms_in_bar_counter()} Rooms"

    if @bar.rooms_in_bar_counter > 0
      @bar.return_all_rooms.each_with_index do |room,index|
        p "Room: #{index+1} has #{room.capacity} capacity and #{room.capacity.to_i - room.guests_in_room_checker.to_i} Available slots"
      end
    end

    p "#{@bar.total_money} Money"
    p "#{@guests_in_queue_array.count} guest in queue" if @guests_in_queue_array.count == 1
    p "#{@guests_in_queue_array.count} guests in queue" if @guests_in_queue_array.count >= 2

    p "#{@songs_in_queue_array.count} song in queue" if @songs_in_queue_array.count == 1
    p "#{@songs_in_queue_array.count} songs in queue" if @songs_in_queue_array.count >= 2

    puts ""
    p "Choose an option"
    p "1: Create a room"
    p "2: Delete a room"
    p "3: Create a guest"
    p "4: Create a song"
    p "5: Adding Items to room"

    key_input = gets.chomp().downcase()

    case key_input
    when "1"
      create_a_room()
    when "2"
      delete_a_room()
    when "3"
      create_a_guest()
    when "4"
      create_a_song()
    when "5"
      add_items_to_room()
    end

  end

end

start_initialize()
main_loop()
