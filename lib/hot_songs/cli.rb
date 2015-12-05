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
    songs, artists, title, week, chart_history = HotSongs::Songs.scrape_songs_artists(genre)
    system 'clear'
    puts "Hottest #{genres[genre.to_i-1]} songs for the week of #{week}".center(125)
    puts
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song} -- #{artists[index-1]}".center(125)}
    2.times {puts}
    puts "Press enter to return to genre list or enter a number to see the song's chart history".center(125)
    answer = gets.chomp
    display_chart_history(songs[answer.to_i-1], artists[answer.to_i-1], chart_history[answer.to_i-1], genre) if ('1'..songs.count.to_s).include?(answer)
    system 'clear' 
  end

  def display_chart_history(song, artist, chart_history, genre)
    system 'clear'
    puts "#{song} - #{artist}".center(125)
    puts
    puts "*****Chart History******".center(125)
    puts 
    chart_history.each_with_index do |stat, index|
      next if index.odd?
      puts "#{stat} -- #{chart_history[index+1]}".center(125)
      puts
    end
    puts "Press enter to return to song list".center(125)
    gets.chomp
    display_songs(genre)
  end

  def main_loop
    about
    loop do 
      break if %w{q quit}.include?(display_menu)
    end
    system 'clear'
    puts "Goodbye!".center(125)
  end
end

