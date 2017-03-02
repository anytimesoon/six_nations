class SixNations::team
  attr_accessor :stats, :players, :fixtures
  attr_reader :nation

  @@all = []

  def initialize(nation)
    @nation = nation
    self.all << self
  end

  def create_all
    [France, England, Wales, Scotland, Ireland, Italy].each {|country| self.new(country) }
  end
end
