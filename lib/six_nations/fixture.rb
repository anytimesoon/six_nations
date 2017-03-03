class SixNations::Fixture
  attr_accessor :teams, :round, :date, :time, :venue

  @@all = []
  @@url = "http://www.rbs6nations.com/en/matchcentre/fixtures_and_results.php"

  def initialize(home_team, away_team, round)
    @teams = {}
    @teams[:home] = home_team
    @teams[:away] = away_team
    @round = round
    @date = "02/02/17" #to be scraped
    @time = {} #to be scraped
    @time[:gmt] = "14:25" #to be scraped
    @time[:local] = "15:25" #to be scraped
    @venue = "Murrayfield" #to be scraped
    @@all << self
  end

  def self.create_all(teams)
    @teams = teams

    html = open(@@url)
    doc = Nokogiri::HTML(html)

    self.create_nested_array_of_teams(doc)
    
  end

  def self.create_nested_array_of_teams(doc)

    home_team = doc.css('.field_HomeDisplay')[1..-1]
    away_team = doc.css('.field_AwayDisplay')[1..-1]
    teams = []
    
    home_team.each_with_index do |name, i|
      fixture = []
      fixture << name.text
      fixture << away_team[i].text
      teams << fixture
    end

    teams
    
    # teams.each do |team|
    #   if home_team == team.name.strip
    #     home_team = team
    #   elsif away_team == team.name.strip
    #     away_team = team
    #   end
    # end
    
  end

end#of Fixture
