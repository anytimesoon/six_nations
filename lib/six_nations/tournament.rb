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

  def team_ranker
    rank = []
    @teams.each do |team|
      pos = team.stats[:position]
      rank[pos.to_i - 1] = team
    end
    rank
  end
end#of Tournament
