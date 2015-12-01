class HotSongs::CLI
  def about
    system 'clear'
    puts "Hot Songs v1.0".center(125)
    puts ""
    puts "The week's most popular songs, based on radio airplay audience impressions as measured by Nielsen Music, sales data 
          as compiled by Nielsen Music and streaming activity data from online music sources tracked by Nielsen Music. 
          Songs are defined as current if they are newly-released titles, or songs receiving widespread airplay and/or 
          sales activity for the first time.".center(421)
    menu
  end

  def display_menu
    3.times {puts}
    genres = %w{ Pop Country Rock R&B/Rap Dance/Electronic Latin Christian/Gospel }
    genres.each.with_index(1) { |genre, index| puts "#{index}. #{genre}".center(125)}
    2.times {puts}
    puts "Please pick a genre to see the week's hottest songs(1-7)".center(125)
    choice = gets.chomp
  end
  
end

