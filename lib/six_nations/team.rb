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
      nation.stats[:position] = "1" #to be scraped
      nation.stats[:games_played] = "3" #to be scraped
      nation.stats[:win] = "2" #to be scraped
      nation.stats[:draw] = "0" #to be scraped
      nation.stats[:loss] = "1" #to be scraped
      nation.stats[:points_for] = "5" #to be scraped
      nation.stats[:points_against] = "6" #to be scraped
      nation.stats[:point_diff] = "4" #to be scraped
      nation.stats[:try_for] = "7" #to be scraped
      nation.stats[:try_against] = "3" #to be scraped
      nation.stats[:try_bonus] = "6" #to be scraped
      nation.stats[:loser_bonus] = "5" #to be scraped
      nation.stats[:points] = "4" #to be scraped
    end
  end

  def get_players
    SixNations::Player.create_all("#{@url}/#{@name.downcase.strip}_squad.php", self)
  end

end#of Team
