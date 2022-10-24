class Player 
  attr_accessor :name, :health

  def initialize(name, health=100)
    @name = name.capitalize 
    @health = health 
    @found_treasures = Hash.new(0)
  end

  def blam
    puts "#{@name} got blammed!"
    @health -= 10
  end

  def w00t
    puts "#{@name} got w00ted!"
    @health += 15
  end

  def score 
    @health + @name.length
  end

  def strong?
    @health >= 150
  end
  
  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def points 
    @found_treasures.values.reduce(0, :+)
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end
end
