module SixNations
  class Team
    attr_accessor :stats, :players, :fixtures
    attr_reader :nation

    @@all = []

    def initialize(nation)
      @nation = nation
      @@all << self
    end

    def self.all
      @@all
    end

    def create_all
      [France, England, Wales, Scotland, Ireland, Italy].each {|country| self.new(country) }
    end
  end
end
