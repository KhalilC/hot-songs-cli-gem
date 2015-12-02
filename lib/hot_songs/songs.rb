class HotSongs::Songs
  attr_accessor :genres

  def self.genres
    @@genres
  end

  def self.get_songs_artists(genre)
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
    doc.css('.row-title h2').each {|artist| songs << artist.text.strip}
    doc.css('.row-title h3').each {|artist| artists << artist.text.strip}

    return songs, artists, title
  end

  def self.get_artists
    html = open('http://www.billboard.com/charts/pop-songs')
    doc = Nokogiri::HTML(html)
    artists = []
    doc.css('.row-title h3').each {|artist| artists << artist.text.strip}
    artists
  end

end
