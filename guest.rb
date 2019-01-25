class Guest

  attr_reader :name, :age

  def initialize(name,age,wallet,favourite_song)
    @name = name
    @age = age
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def get_favourite_song
    return @favourite_song
  end

  def check_for_fav_song(playlist)
    if (playlist.any? {|song| song.title == @favourite_song})
      return "WHoo"
    end
  end

  def get_money_left
    return @wallet
  end

  def reduce_money(amount)
    @wallet -= amount
  end



end
