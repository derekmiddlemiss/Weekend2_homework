class Room

  attr_reader :number, :guestlist, :playlist, :fee, :capacity

  def initialize( number, fee, capacity )
    @number = number
    @guestlist = []
    @playlist = []
    @fee = fee
    @capacity = capacity
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


end

