class Room

  attr_reader :number, :guestlist, :playlist, :fee, :capacity, :message

  def initialize( number, fee, capacity )
    @number = number
    @guestlist = []
    @playlist = []
    @fee = fee
    @capacity = capacity
    @message = ""
  end

  def check_in( guest )
    if @guestlist.count < @capacity

      if ( guest.make_payment( @fee ) ) 
        @guestlist << guest
      else
        puts "Guest not added to room #{@number}, payment declined."
      end

    else

      puts "Guest not added to room #{@number}, full."

    end
  end

  def check_out( guest )
    @guestlist.delete( guest )
  end

  def add_song( song )
    @playlist << song
    song.played
    for guest in @guestlist do
      if ( guest.fav_song == song.title )
        set_message( "Whoo!" )
      end
    end
  end

  def set_message( message )
    @message = message
  end

  def clear_message
    @message = ""
  end

end

