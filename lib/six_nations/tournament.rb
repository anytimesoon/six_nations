class SixNations::Tournament
  attr_accessor :teams, :nations
  
  def initialize
    @nations = ["France", "England", "Wales", "Scotland", "Ireland", "Italy"]
    @teams = SixNations::Team.create_all(@nations)
    SixNations::Team.get_stats
  end

  def display_table
    current_ranking = team_ranker
    
    puts "Pos | Team  | Pl | W | D | L | PF | PA | Diff | TF | TA | TB | LB | Pts"
    puts current_ranking[0]
    puts current_ranking[1]
    puts current_ranking[2]
    puts current_ranking[3]
    puts current_ranking[4]
    puts current_ranking[5]
  end
end#of Tournament
