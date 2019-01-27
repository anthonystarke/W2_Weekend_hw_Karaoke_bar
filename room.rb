class Room

  attr_reader :capacity, :entry_fee
  # attr_writer :entry_fee

  def initialize(capacity)
    @capacity = capacity
    @entry_fee = entry_fee
    @guests_in_room = []
    @songs_in_playlist = []
    @total_money = 0
  end

  def change_entry_fee(new_price)
    @entry_fee = new_price
  end

  def number_of_songs
    return @songs_in_playlist.count
  end

  def add_song_to_playlist(new_song)
    @songs_in_playlist << new_song
  end

  def return_all_songs
    return @songs_in_playlist
  end

  def return_all_songs_via_title
    return @songs_in_playlist.map{|song| song.title}
  end

  def clear_playlist
    @songs_in_playlist.clear
  end

  def guests_in_room_checker
    return @guests_in_room.count
  end

  def check_guest_in(new_guest)
    @guests_in_room << new_guest
    new_guest.check_for_fav_song(@songs_in_playlist)
  end

  def space_in_room
    if @capacity > @guests_in_room.count
      return true
    end
    return false
  end

  def return_total_money
    return @total_money
  end

  def check_guest_can_afford(new_guest)
    if new_guest.get_money_left > @entry_fee
      return true
    end
    return false
  end

  def return_guest_list
    return @guests_in_room
  end

  def check_out_guest(guest)
    @guests_in_room.delete(guest)
  end

  def remove_song_from_playlist(name_of_song)
    song_to_remove = @songs_in_playlist.find {|song| song.title == name_of_song}
    @songs_in_playlist.delete(song_to_remove)
  end

end
