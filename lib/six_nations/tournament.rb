class SixNations::Tournament
  attr_accessor :teams, :nations, :fixtures

  def initialize
    @nations = ["France  ", "England ", "Wales   ", "Scotland", "Ireland ", "Italy   "]
    @teams = SixNations::Team.create_all(@nations)
    SixNations::Team.get_stats
  end

  def display_table
    current_ranking = team_ranker

    puts "Pos |   Team   | Pl | W | D | L | PF | PA | Diff | TF | TA | TB | LB | Pts"
    current_ranking.each do |team|
      print "  #{team.stats[:position]} | #{team.name} | #{team.stats[:games_played]}  | #{team.stats[:win]} | #{team.stats[:draw]} | #{team.stats[:loss]} | #{team.stats[:points_for]}  | #{team.stats[:points_against]}  |   #{team.stats[:point_diff]}  | "
      puts "#{team.stats[:try_for]}  | #{team.stats[:try_against]}  | #{team.stats[:try_bonus]}  |  #{team.stats[:loser_bonus]} |  #{team.stats[:points]}"
    end
  end

  def team_ranker
    rank = []
    @teams.each do |team|
      pos = team.stats[:position]
      rank[pos.to_i - 1] = team
    end
    rank
  end

  def get_fixtures
    @fixtures << SixNations::Fixtures.create_all
  end
end#of Tournament
