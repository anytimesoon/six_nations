class SixNations::CLI

  def start
    puts <<~DOC
      Welcome to the Six Nations Ruby Gem
      Would you like to see the current table, upcomming fixtures, or find out more about a team?
    DOC
    input = gets.strip.downcase
  end
end
