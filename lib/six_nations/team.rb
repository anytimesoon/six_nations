module SixNations
  class Team
    attr_accessor :stats, :players, :fixtures
    attr_reader :name

    @@all = []

    def initialize(name)
      @name = name
      @stats = {}
      @@all << self
    end

    def self.all
      @@all
    end

    def self.create_all
      ["France", "England", "Wales", "Scotland", "Ireland", "Italy"].each {|nation| self.new(nation) }
    end

    def self.get_stats
      @@all.each do |nation|
        binding.pry
        nation.stats[:position] = "1"
        nation.stats[:games_played] = "3"
        nation.stats[:win] = "2"
        nation.stats[:draw] = "0"
        nation.stats[:loss] = "1"
        nation.stats[:points_for] = "5"
        nation.stats[:points_agains] = "6"
        nation.stats[:point_diff] = "4"
        nation.stats[:try_bonus] = "6"
        nation.stats[:user_bonus] = "5"
        nation.stats[:points] = "4"
      end
    end

  end#of Team
end#of SixNations
