class SixNations::Team
  attr_accessor :stats, :players, :fixtures
  attr_reader :name, :url

  @@all = []

  def initialize(name)
    @name = name
    @stats = {}
    @players = []
    @fixtures = []
    @url = "http://www.rbs6nations.com/en/#{@name.downcase.strip}"
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_all(nations)
    (nations).map {|nation| self.new(nation) }
  end

  def self.get_stats
    @@all.each do |nation|
      nation.stats[:position] = "1"
      nation.stats[:games_played] = "3"
      nation.stats[:win] = "2"
      nation.stats[:draw] = "0"
      nation.stats[:loss] = "1"
      nation.stats[:points_for] = "5"
      nation.stats[:points_against] = "6"
      nation.stats[:point_diff] = "4"
      nation.stats[:try_for] = "7"
      nation.stats[:try_against] = "3"
      nation.stats[:try_bonus] = "6"
      nation.stats[:loser_bonus] = "5"
      nation.stats[:points] = "4"
    end
  end

  def get_players
    @players << SixNations::Player.create_all("#{@url}/#{@name.downcase.strip}_squad.php")
  end

  def get_fixtures
    @fixtures << SixNations::Fixtures.create_all
  end

end#of Team
