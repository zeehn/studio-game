require_relative "player"

describe Player do 
  before do 
    $stdout = StringIO.new
    @initial_health = 150
    @player = Player.new("larry", @initial_health)
  end

  it "has a capitalized name" do 
    expect(@player.name).to eq("Larry")
  end

  it "has an initial health" do 
    expect(@player.health).to eq(150)
  end

  it "has a string representation" do 
    expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
  end

  it "computes a score as the sum of its health and length of name" do 
    expect(@player.score).to eq(150 + 5)
  end

  it "increases health by 15 when w00ted" do 
    @player.w00t

    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do 
    @player.blam

    expect(@player.health).to eq(@initial_health - 10)
  end

  context "with a health greater than 100" do 
    before do 
      @initial_rank = 150
      @player = Player.new("goonies", @initial_rank)
    end

    it "is a strong player" do 
      expect(@player.strong?).to eq(true)
    end
  end

  context "with a health of 100 or less" do 
    before do 
      @initial_rank = 100
      @player = Player.new("goonies", @initial_rank)
    end

    it "is a wimpy player" do 
      expect(@player.strong?).to eq(false)
    end
  end

  it "computes points as the sum of all treasure points" do 
    expect(@player.points).to eq(0)

    @player.found_treasure(Treasure.new(:hammer, 50))
    expect(@player.points).to eq(50)
    @player.found_treasure(Treasure.new(:crowbar, 400))
    expect(@player.points).to eq(450)
  end
end
