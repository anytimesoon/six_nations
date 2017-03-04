class SixNations::CLI

  def start
    input = ""
    puts "Please wait while data is downloaded..."
    tourn = SixNations::Tournament.new

    while input != "exit" || input != "4"
      puts <<~DOC
        Welcome to the Six Nations Ruby Gem
        Would you like to see:
        1. Current table
        2. Upcomming fixtures
        3. Find out more about a team
        4. Exit
      DOC

      input = gets.strip.downcase
      case input
      when "1"
        tourn.display_table
      when "2"
        puts "upcomming fixtures"
      when "3"
        puts <<~DOC 
          Which team would you like to know about?
          1. England
          2. France
          3. Ireland
          4. Italy
          5. Scotland
          6. Wales
        DOC
        requested_team = gets.strip.downcase
        self.team_menu(requested_team)
      when "4"
        puts "Thanks for playing. See you next time"
        break
      else
        puts "I'm not sure what you mean, please choose 1, 2, 3 or 4."
      end
    end
  end

  def team_menu(requested_team)
    puts "What would you like to know about #{requested_team}?"
    team_info = gets.strip.downcase
    puts "Information you have requested"
  end
  
end#of CLI
