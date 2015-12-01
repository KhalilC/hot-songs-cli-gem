class HotSongs::Songs
  def self.get_songs
    html = open('http://www.billboard.com/charts/pop-songs')
    doc = Nokogiri::HTML(html)
    songs = []
    artists = []
    doc.css('.row-title h2').each {|artist| songs << artist.text.strip}
    doc.css('.row-title h3').each {|artist| artists << artist.text.strip}
    songs.each_with_index {|song, index| puts "#{index+1}. #{song} -  #{artists[index]}"}
  end
end
