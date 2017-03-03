class SixNations::Team
  attr_accessor :stats, :players, :fixtures
  attr_reader :name, :url

  @@all = []

  def initialize(name)
    @name = name
    @stats = {}
    @players = []
    @fixtures = []
    @url = "http://www.rbs6nations.com/en/matchcentre/league_table.php"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_all(nations)
    (nations).map {|nation| self.new(nation) }
  end

  def get_stats
    html = open("@url")
    doc = Nokogiri::HTML(html)
    
    @@all.each do |nation|
      nation.stats[:position] = doc.css(".field_Position").text
      nation.stats[:games_played] = doc.css(".field_Played").text
      nation.stats[:win] = doc.css(".field_Win").text
      nation.stats[:draw] = doc.css(".field_Draw").text
      nation.stats[:loss] = doc.css(".field_Lose").text
      nation.stats[:points_for] = doc.css(".field_PtsFor").text
      nation.stats[:points_against] = doc.css(".field_PtsAgainst").text
      nation.stats[:point_diff] = doc.css(".field_PtsDiff").text
      nation.stats[:try_for] = doc.css(".field_TryFor").text
      nation.stats[:try_against] = doc.css(".field_TryAgainst").text
      nation.stats[:try_bonus] = doc.css(".field_TryBonus").text
      nation.stats[:loser_bonus] = doc.css(".field_LoseBonus").text
      nation.stats[:points] = doc.css(".field_Points").text
    end
  end

  def get_players
    SixNations::Player.create_all("#{@url}/#{@name.downcase.strip}_squad.php", self)
  end

end#of Team
