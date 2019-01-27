require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class Minitest::Test

  def setup
    @song = Song.new("Eye of the Tiger")
  end

  def test_song_name
    assert_equal("Eye of the Tiger",@song.title)
  end

end
