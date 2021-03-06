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
    @teams.each do |team|
      @fixtures.each do |fixture|
        # binding.pry
        if fixture.teams[:home] == team || fixture.teams[:away] == team
          team.fixtures << fixture
        end
      end
    end
  end

  def find_team_by_name(name)
    @teams.each do |team|
      if team.name == name
        return team
      end
    end
  end

  def display_fixtures
    fixture_round = 1
    while fixture_round < 6
      table = Terminal::Table.new :title => "Round #{fixture_round}", :headings => ['Date', 'Local Time', 'GMT', 'Home Team', 'Away Team', 'Venue']
      round = self.fixture_rounds(fixture_round)
      # binding.pry
      round.each do |fixture|
        table.add_row [fixture.date, fixture.time[:local], fixture.time[:gmt], fixture.teams[:home].name, fixture.teams[:away].name, fixture.venue]
      end
      puts table
      fixture_round += 1
    end
  end

  def fixture_rounds(round)
    returned_fixtures = []
    @fixtures.each do |fixture|
      if fixture.round == round
        # binding.pry
        returned_fixtures << fixture
      end
    end
    returned_fixtures
  end
end#of Tournament
