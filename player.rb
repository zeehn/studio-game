class Player 
  attr_accessor :name, :health

  def initialize(name, health=100)
    @name = name.capitalize 
    @health = health 
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
    @health += @name.length
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end
end
