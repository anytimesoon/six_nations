class SixNations::Player
  attr_accessor :caps, :points
  attr_reader :team, :name

  @@all = []

  def initialize(url, team)
    @team = team
    @name = "Name" #need to be scraped
    @caps = "4" #need to be scraped
    @points = "200" #need to be scraped
  end

  def self.create_all(url, team)
    40.times do
      team.players << self.new(url, team)
    end
  end

end#of Player