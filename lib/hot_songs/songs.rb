class HotSongs::Songs

  attr_accessor :stats
  
  def self.scrape_songs_artists(genre)
    genres = ['http://www.billboard.com/charts/pop-songs',
            'http://www.billboard.com/charts/country-songs',
            'http://www.billboard.com/charts/rock-songs',
            'http://www.billboard.com/charts/r-b-hip-hop-songs',
            'http://www.billboard.com/charts/dance-electronic-songs',
            'http://www.billboard.com/charts/latin-songs',
            'http://www.billboard.com/charts/christian-songs']
    html = open(genres[genre.to_i-1])
    doc = Nokogiri::HTML(html)
    songs = []
    artists = []
    title = doc.css('.chart-header-headline span').text
    week = doc.css('time').text
    doc.css('.row-title h2').each {|song| songs << song.text.strip}
    doc.css('.row-title h3').each {|artist| artists << artist.text.strip}
    return songs, artists, title, week, self.song_chart_history(doc)
  end

  def self.song_chart_history(doc)
    stats = []
    doc.css('.stats').each { |song| stats << song.children.text.split("\n")}
    chart_history = stats.map do |stat|
      stats = stat.map {|history_stat| history_stat.strip}.select {|word| word != "" }
    end
    chart_history
  end
end



