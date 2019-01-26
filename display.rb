class Display

  def initialize
  end

  def display_room_capacity(room)
    p room.capacity
  end

  def display_num_guest_in_room(room)
    p room.guests_in_room_checker
  end

  def display_guests_in_room(room)
    p room.return_guest_list
  end

  def display_playlist_count(room)
    p room.number_of_songs
  end

  def display_playlist_list_via_title(room)
    p room.return_all_songs_via_title
  end



end
