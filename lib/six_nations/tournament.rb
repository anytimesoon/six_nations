class SixNations::Tournament
  attr_accessor :teams, :nations, :fixtures

  def initialize
    @nations = ["France", "England", "Wales", "Scotland", "Ireland", "Italy"]
    @teams = SixNations::Team.create_all(@nations)
    SixNations::Team.get_stats
    self.get_fixtures
  end

  def display_table
    current_ranking = team_ranker

    table = Terminal::Table.new :headings => ['Pos', 'Team', 'Pl', 'W', 'D', 'L', 'PF', 'PA', 'Diff', 'TF', 'TA', 'TB', 'LB', 'Pts']

    current_ranking.each do |team|
      table.add_row [team.stats[:position], team.name, team.stats[:games_played], team.stats[:win], team.stats[:draw], team.stats[:loss], team.stats[:points_for],
                    team.stats[:points_against], team.stats[:point_diff], team.stats[:try_for], team.stats[:try_against], team.stats[:try_bonus], team.stats[:loser_bonus],
                    team.stats[:points]]
    end

    puts table
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
    @fixtures = SixNations::Fixture.create_all(@teams)
  end

  def find_team_by_name(name)
    @teams.each do |team|
      if team.name == name
        return team
      end
    end
  end
end#of Tournament
