require_relative "die"
require_relative "game_turn"
require_relative "treasure_trove"
class Game 
  def initialize(title)
    @title = title.capitalize 
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"
    puts @players

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points."
    end

    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    puts "\n#{@title}s Statistics:"

    strong, wimpy = @players.partition { |player| player.strong? }

    puts "\n#{strong.size} strong Players:"
    puts strong

    puts "\n#{wimpy.size} wimpy players"
    puts wimpy
  end
end
