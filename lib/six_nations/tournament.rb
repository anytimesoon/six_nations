class SixNations::Tournament
  attr_accessor :teams, :nations

  
  
  def initialize
    @teams = []
    @nations = ["France", "England", "Wales", "Scotland", "Ireland", "Italy"]
    SixNations::Team.get_stats
  end

  def get_teams
    @teams = SixNations::Team.create_all(@nations)
  end
end
