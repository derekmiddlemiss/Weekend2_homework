class Song

  attr_reader :title, :artist, :number_of_plays

  def initialize( title, artist )
    @title = title
    @artist = artist
    @number_of_plays = 0
  end

  def played
    @number_of_plays += 1
  end

end