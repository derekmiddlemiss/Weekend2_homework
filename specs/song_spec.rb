require ('minitest/autorun')
require_relative('../song.rb')

class TestSong < Minitest::Test

  def setup
    @bohemian_rhapsody = Song.new( "Bohemian Rhapsody", "Queen" )
  end

  def test_song_title
    assert_equal( "Bohemian Rhapsody", @bohemian_rhapsody.title )
  end

  def test_song_artist
    assert_equal( "Queen", @bohemian_rhapsody.artist )
  end

  def test_number_of_plays
    assert_equal( 0, @bohemian_rhapsody.number_of_plays )
  end

  def test_played
    @bohemian_rhapsody.played
    assert_equal( 1, @bohemian_rhapsody.number_of_plays )
  end

end