class Game 
  def initialize(title)
    @title = title.capitalize 
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{@title}:"
    puts @players
  end
end
