class Guest

  attr_reader :first_name, :last_name, :cash_balance, :fav_song

  def initialize( first_name, last_name, cash_balance, fav_song="" )
    @first_name = first_name
    @last_name = last_name
    @cash_balance = cash_balance
    @fav_song = fav_song
  end

  def make_payment( amount )
    if ( @cash_balance >= amount )
      @cash_balance -= amount
      return true
    else
      return false
    end
  end

end