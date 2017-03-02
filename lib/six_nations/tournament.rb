class SixNations::Tournament
  attr_accessor :teams

  @@nations = ["France", "England", "Wales", "Scotland", "Ireland", "Italy"]
  
  def initialize
    @teams = SixNations::Team.create_all
    SixNations::Team.get_stats
  end
end
