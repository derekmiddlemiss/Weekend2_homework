require_relative("./guest")
require_relative("./room")
require_relative("./song")

class Karaoke

  def initialize
    @room1 = Room.new(1, 20, 10)
    @room2 = Room.new(2, 20, 10)
    @room3 = Room.new(3, 20, 20)
    @room4 = Room.new(4, 20, 20)
    @room5 = Room.new(5, 20, 30)
    @rooms = [@room1, @room2, @room3, @room4, @room5]
    @hakuna_matata = Song.new( "Hakuna Matata", "Elton John & Tim Rice" )
    @walk_wild_side = Song.new( "Walk on the Wild Side", "Lou Reed" )
    @bohemian_rhapsody = Song.new( "Bohemian Rhapsody", "Queen" )
    @no_more_heroes = Song.new( "No More Heroes", "The Stranglers" )
    @go_with_the_flow = Song.new( "Go With the Flow", "Queens of the Stone Age" )
    @once_in_a_lifetime = Song.new( "Once in a Lifetime", "Talking Heads" )
    @paint_it_black = Song.new( "Paint it Black", "The Rolling Stones" )
    @songs = [@hakuna_matata, @walk_wild_side, @bohemian_rhapsody, @no_more_heroes, @go_with_the_flow, @once_in_a_lifetime, @paint_it_black]
  end

  def run(name)

    input = ""

    while ( input != "q" ) do
      system("clear")
      puts "-#{name}-"
      puts
      print_songs
      puts
      print_rooms
      clear_room_messages
      puts
      puts "I Check-in guest"
      puts "O Check-out guest"
      puts "A Add song to room playlist"
      puts "Q Quit"
      puts "Selection:"
      input = gets.chomp.downcase

      case input
        when "i"
          check_in_guest
        when "o"
          check_out_guest
        when "a"
          add_song_to_room
        when "q"
          puts "End of program"
      end
    end
  end

  def print_rooms
    for room in @rooms do
      puts "Room #{room.number} Guests:#{room.guestlist.count} Capacity: #{room.capacity} Fee:#{room.fee} Messages: #{room.message}"
        for guest in room.guestlist do
          puts "#{guest.first_name} #{guest.last_name} £#{guest.cash_balance}"
        end
    end
  end

  def print_songs
    for song in @songs do
      puts " '#{song.title}' by #{song.artist} -- Plays: #{song.number_of_plays}"
    end
  end

  def clear_room_messages
    @rooms.each { |room| room.clear_message }
  end


  def check_in_guest
    puts "Check in guest"
    puts "Which room number?"
    number = gets.chomp.to_i
    puts "First name?"
    first_name = gets.chomp
    puts "Last name?"
    last_name = gets.chomp
    puts "Cash balance?"
    balance = gets.chomp.to_i
    puts "Favourite song?"
    fav_song = gets.chomp

    guest = Guest.new( first_name, last_name, balance, fav_song )
    room = @rooms.find { |room| room.number == number }

    room.check_in( guest )
  end

  def check_out_guest
    puts "Check out guest"
    puts "Which room number?"
    number = gets.chomp.to_i
    puts "First name?"
    first_name = gets.chomp
    puts "Last name?"
    last_name = gets.chomp

    room = @rooms.find { |room| room.number == number }
    guest = room.guestlist.find { |guest| guest.first_name == first_name && guest.last_name == last_name}

    room.check_out( guest )
  end

  def add_song_to_room
    puts "Add song"
    puts "Which room number?"
    number = gets.chomp.to_i
    puts "Song title?"
    title = gets.chomp
    room = @rooms.find { |room| room.number == number }
    song = @songs.find { |song| song.title == title }

    room.add_song( song )
  end

end

wck = Karaoke.new
wck.run("Wailing Cat Karaoke")






