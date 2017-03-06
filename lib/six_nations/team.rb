class SixNations::Team
  attr_accessor :stats, :players, :fixtures
  attr_reader :name, :url

  @@all = []
  @@url = "http://www.rbs6nations.com/en/matchcentre/league_table.php"

  def initialize(name)
    @name = name
    @stats = {}
    @players = []
    @fixtures = []
    @@all << self
    self.get_players
  end

  def self.all
    @@all
  end

  def self.create_all(nations)
    (nations).map {|nation| self.new(nation) }
  end

  def self.get_stats
    html = open(@@url)
    doc = Nokogiri::HTML(html)
    table = doc.css('.leaguetab')

    @@all.each do |nation|

      row = table.search "[text()*='#{nation.name}']"
      row = row.first.parent

      nation.stats[:position] = row.css(".field_Position").text
      nation.stats[:games_played] = row.css(".field_Played").text
      nation.stats[:win] = row.css(".field_Win").text
      nation.stats[:draw] = row.css(".field_Draw").text
      nation.stats[:loss] = row.css(".field_Lose").text
      nation.stats[:points_for] = row.css(".field_PtsFor").text
      nation.stats[:points_against] = row.css(".field_PtsAgainst").text
      nation.stats[:point_diff] = row.css(".field_PtsDiff").text
      nation.stats[:try_for] = row.css(".field_TryFor").text
      nation.stats[:try_against] = row.css(".field_TryAgainst").text
      nation.stats[:try_bonus] = row.css(".field_TryBonus").text
      nation.stats[:loser_bonus] = row.css(".field_LoseBonus").text
      nation.stats[:points] = row.css(".field_Points").text
    end
  end

  def get_players
    SixNations::Player.create_all("http://www.rbs6nations.com/en/#{@name.downcase}/#{@name.downcase}_squad.php", self)
  end

  def display_players
    table = Terminal::Table.new :headings => ['Name', 'Caps', 'Points']
    @players.each do |player|
      table.add_row [player.name, player.caps, player.points]
    end

    puts table
  end

  def display_fixtures
    table = Terminal::Table.new :headings => ['Round', 'Date', 'Local Time', 'GMT', 'Home Team', 'Away Team', 'Venue']
    @fixtures.each do |fixture|
      table.add_row [fixture.round, fixture.date, fixture.time[:local], fixture.time[:gmt], fixture.teams[:home].name, fixture.teams[:away].name, fixture.venue]
    end

    puts table
  end

end#of Team
