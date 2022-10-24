require_relative "game"
require_relative "player"

describe Game do 
  before do 
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    @game.add_player(@player)
  end

  it "w00ts the player if a high number is rolled" do 
    allow_any_instance_of(Die).to receive(:roll).and_return(5)

    @game.play(1)

    expect(@player.health).to eq(@initial_health + 15)
  end

  it "skips the player if a medium number is rolled" do 
    allow_any_instance_of(Die).to receive(:roll).and_return(3)
    @game.play(1)
    expect(@player.health).to eq(@initial_health)
  end

  it "blams the player if a low number is rolled" do 
    allow_any_instance_of(Die).to receive(:roll).and_return(1)
    @game.play(1)
    expect(@player.health).to eq(@initial_health - 10)
  end

  it "assigns a treasure for points during a player's turn" do 
    game = Game.new("Knuckleheads")
    player = Player.new("moe")

    game.add_player(player)
    game.play(1)
  end
end
