class SixNations::Player
  attr_accessor :caps, :points
  attr_reader :team, :name

  @@all = []

  def initialize(team, name, caps, points)
    @team = team
    @name = name #need to be scraped
    @caps = caps #need to be scraped
    @points = points #need to be scraped
  end

  def self.create_all(url, team)
    html = open(url)
    doc = Nokogiri::HTML(html)
    table = doc.css('.player_card')
    table.each do |player|
      name = player.css('.player_name p').text
      caps = player.css('.player_caps_value p').text
      points = player.css('.player_pts_value p').text
      team.players << self.new(team, name, caps, points)
    end
  end

end#of Player