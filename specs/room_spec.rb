require ('minitest/autorun')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class TestRoom < Minitest::Test

  def setup
    @room1 = Room.new( 1, 20, 5 )
    @bill_treble = Guest.new( "Bill", "Treble", 30 )
    @suzy_tenor = Guest.new( "Suzy", "Tenor", 60 )
    @alan_alto = Guest.new( "Alan", "Alto", 40 )
    @brenda_bass = Guest.new( "Brenda", "Bass", 55 )
    @tony_tonedeaf = Guest.new( "Tony", "Tonedeaf", 45 )
    @cecilia_croaker = Guest.new( "Cecilia", "Croaker", 80 )
    @simon_skint = Guest.new( "Simon", "Skint", 10 )
    @hakuna_matata = Song.new( "Hakuna Matata", "Elton John & Tim Rice" )    
  end

  def test_room_number
    assert_equal( 1, @room1.number )
  end

  def test_fee
    assert_equal( 20, @room1.fee )
  end  

  def test_guestlist_empty
    assert_equal( 0, @room1.guestlist.count )
  end

  def test_playlist_empty
    assert_equal( 0, @room1.playlist.count )
  end  

  def test_check_in__sufficient_cash
    @room1.check_in( @bill_treble )
    assert_equal( 1, @room1.guestlist.count )
    assert_equal( "Treble", @room1.guestlist[0].last_name )
    assert_equal( 10, @bill_treble.cash_balance )
  end

  def test_check_in__insufficient_cash
    @room1.check_in( @simon_skint )
    assert_equal( 0, @room1.guestlist.count )
    assert_equal( 10, @simon_skint.cash_balance )
  end

  def test_check_in__room_at_capacity
    @room1.check_in( @bill_treble )
    @room1.check_in( @suzy_tenor )
    @room1.check_in( @alan_alto )
    @room1.check_in( @brenda_bass )
    @room1.check_in( @tony_tonedeaf )
    assert_equal( 5, @room1.guestlist.count )
    @room1.check_in( @cecilia_croaker )
    assert_equal( 5, @room1.guestlist.count )
    assert_equal( "Tonedeaf", @room1.guestlist[4].last_name )
  end

  def test_check_out
    @room1.check_in( @bill_treble )
    @room1.check_in( @suzy_tenor )
    @room1.check_out( @bill_treble )
    assert_equal( 1, @room1.guestlist.count )
    assert_equal( "Tenor", @room1.guestlist[0].last_name )
  end

  def test_add_song
    @room1.add_song( @hakuna_matata )
    assert_equal( 1, @room1.playlist.count )
    assert_equal( "Hakuna Matata", @room1.playlist[0].title )
    assert_equal( 1, @hakuna_matata.number_of_plays )
  end









end