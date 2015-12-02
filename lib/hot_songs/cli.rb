
class HotSongs::CLI
  attr_accessor :genres
  def initialize
    @genres = %w{ Pop Country Rock R&B/Rap Dance/Electronic Latin Christian/Gospel }
  end
  def about
    system 'clear'
    puts "Hot Songs v1.0".center(125)
    puts ""
    puts "The week's most popular songs, based on radio airplay audience impressions as measured by Nielsen Music, sales data 
          as compiled by Nielsen Music and streaming activity data from online music sources tracked by Nielsen Music. 
          Songs are defined as current if they are newly-released titles, or songs receiving widespread airplay and/or 
          sales activity for the first time.".center(421)
    3.times {puts}
  end

  def display_menu
    genres.each.with_index(1) { |genre, index| puts "#{index}. #{genre}".center(125)}
    puts
    user_input  
  end

  def user_input
    begin
    print "Please pick a genre to see the week's hottest songs(1-7)('q' or quit to exit): ".center(125)
    choice = gets.chomp.downcase
    return choice if choice == 'q' || choice == 'quit'
    end until ('1'..'7').to_a.include?(choice)
    display_songs(choice)
  end

  def display_songs(genre)
    puts
    songs, artists, title = HotSongs::Songs.get_songs_artists(genre)
    system 'clear'
    puts "This week's hottest #{genres[genre.to_i-1]} songs".center(125)
    puts
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song} -- #{artists[index-1]}".center(125)}
    2.times {puts}
    puts "Press enter to return to main menu".center(125)
    gets.chomp
    system 'clear'
  end

  def main_loop
    about
    loop do 
      break if %w{q quit}.include?(display_menu)
    end
  end
end

