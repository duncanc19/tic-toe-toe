require_relative "../check_draw"

context CheckDraw do
  describe "given an unfinished board" do
    it "returns false" do
      # Arrange
      game = Game.new
      # Act
      result = CheckDraw.check_draw(game)
      # Assert
      expect(result).to eq(false)
    end
  end    
  describe "given a full board" do
    it "returns false" do
      # Arrange
      game = Game.new
      game.game_state = [['x','x','o'],['o','o','x'],['x','o','x']]
      # Act
      result = CheckDraw.check_draw(game)
      # Assert
      expect(result).to eq(true)
    end
  end
  describe "given another full board" do
    it "returns false" do
      # Arrange
      game = Game.new
      game.game_state = [['o','x','o'],['o','o','x'],['x','o','x']]
      # Act
      result = CheckDraw.check_draw(game)
      # Assert
      expect(result).to eq(true)
    end
  end     
  describe "given another full board" do
    it "returns false" do
      # Arrange
      game = Game.new
      game.game_state = [['o','x','o'],['o','x','x'],['x','o','x']]
      # Act
      result = CheckDraw.check_draw(game)
      # Assert
      expect(result).to eq(true)
    end
  end     
end