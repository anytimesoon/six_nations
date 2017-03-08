class SixNations::CLI
  attr_accessor :tourn, :teams

  def start

    puts "Please wait while data is downloaded. This might take some time depending on your internet connection."
    puts "Sit back, relax. Make yourself a cup of tea, or grab a beer."
    @tourn = SixNations::Tournament.new
    @teams = []
    
    self.main_menu

  end

  def main_menu
    input = ""
    team_input = ""

    while input != "4" do

      break if team_input == "4"

      puts <<~DOC
        Welcome to the Six Nations Ruby Gem
        Would you like to see:
        1. Current table
        2. Fixtures
        3. Find out more about a team
        4. Exit
      DOC

      input = gets.strip.downcase
      case input
      when "1"
        @tourn.display_table
      when "2"
        @tourn.display_fixtures
      when "3"
        puts "Which team would you like to know about?"

        @tourn.teams.each_with_index do |team, i|
          puts "#{i + 1}. #{team.name}"
          @teams << team.name
        end

        requested_team = gets.strip.downcase.to_i - 1
        team_input = self.team_menu(requested_team)
      when "4"
        puts "Thanks for playing. See you next time"
        break
      else
        puts "I'm not sure what you mean, please choose 1, 2, 3 or 4."
      end
    end
  end

  def team_menu(requested_team)

    team_info = ""
    until team_info == "3" do
      puts <<~DOC
        What would you like to know about #{@teams[requested_team]}?
        1. Fixtures
        2. Players
        3. Back to main menu
        4. Exit
      DOC

      team = @tourn.find_team_by_name(@teams[requested_team])
      team_info = gets.strip.downcase

      case team_info
      when '1'
        team.display_fixtures
      when "2"
        team.display_players
      when "3"
        puts ""
      when "4"
        puts "Thanks for your time. See you again soon."
        return "4"
      else
        puts "Sorry, I didn't get that. Please enter 1, 2 or 3."
      end
    end
  end

end#of CLI
