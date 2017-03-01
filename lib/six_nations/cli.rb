class SixNations::CLI

  def start
    puts <<~DOC
      Welcome to the Six Nations Ruby Gem
      Would you like to see:
      1. current table
      2. upcomming fixtures
      3. find out more about a team
      4. exit
    DOC

    input = ""
    
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1" || "current table"
        puts "current table"
      when "2" || "upcomming fixtures"
        puts "upcomming fixtures"
      when "3" || "find out more about a team"
        puts "Which team would you like to know about?"
        requested_team = gets.strip.downcase
        puts "What would you like to know about #{requested_team}?"
        team_info = gets.strip.downcase
        puts "Information you have requested"
      when "exit"
        puts "Thanks for playing. See you next time"
      else
        puts "I'm not sure what you mean, please choose 1, 2, 3 or exit."
      end
    end
  end
end
