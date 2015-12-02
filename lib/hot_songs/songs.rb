class HotSongs::Songs
  def self.get_songs
    html = open('http://www.billboard.com/charts/pop-songs')
    doc = Nokogiri::HTML(html)
    songs = []
    doc.css('.row-title h2').each {|artist| songs << artist.text.strip}
    songs
  end

  def self.get_artists
    html = open('http://www.billboard.com/charts/pop-songs')
    doc = Nokogiri::HTML(html)
    artists = []
    doc.css('.row-title h3').each {|artist| artists << artist.text.strip}
    artists
  end
end
