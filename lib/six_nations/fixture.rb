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

  def create_all(home_team, away_team)
    html = open(@@url)
    doc = Nokogiri::HTML(html)

    
  end

end#of Fixture
