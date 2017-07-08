require ('minitest/autorun')
require_relative('../guest.rb')

class TestGuest < Minitest::Test

  def setup
    @bill_treble = Guest.new( "Bill", "Treble", 30 )
  end

  def test_first_name
    assert_equal( "Bill", @bill_treble.first_name )
  end

  def test_last_name
    assert_equal( "Treble", @bill_treble.last_name )
  end

  def test_cash_balance
    assert_equal( 30, @bill_treble.cash_balance )
  end

  def test_make_payment__sufficient_cash
    actual = @bill_treble.make_payment( 10 )
    assert_equal( true, actual )
    assert_equal( 20, @bill_treble.cash_balance )
  end

  def test_make_payment__insufficient_cash
    actual = @bill_treble.make_payment( 40 )
    assert_equal( false, actual )
    assert_equal( 30, @bill_treble.cash_balance )
  end

end