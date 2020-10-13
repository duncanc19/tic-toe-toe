require_relative "../game_controller"
require_relative "../game"

context Game do
  describe "#verify_and_format_move" do
    it "returns false when given empty string" do
      # Arrange
      game = Game.new
      invalid_move = ""
      # Act
      result = game.verify_and_format_move(invalid_move)
      # Assert  
      expect(result).to eq(false)  
    end
    it "returns array when given valid move" do
      # Arrange
      game = Game.new
      valid_move = "0,2"
      # Act
      result = game.verify_and_format_move(valid_move)
      # Assert  
      expect(result).to eq([0,2])  
    end
  end

  describe "#play_move" do
    it "returns false when move is invalid as per game.add_move" do
      # Arrange
      game = Game.new
      game.verified_move = [0,5]
       # Act
      result = game.play_move
      # Assert  
      expect(result).to eq(false)
    end
    it "returns true when move is valid" do
      # Arrange
      game = Game.new
      game.verified_move = [0,2]
       # Act
      result = game.play_move
      # Assert  
      expect(result).to be_truthy
    end

    it "updates game.game_state when move is in empty square" do
      # Arrange
      game = Game.new
      game.verified_move = [0,2]
      expected_gamestate = [['','', 'x'],['','', ''],['','', '']]
      # Act
      result = game.play_move
      # Assert  
      expect(game.game_state).to eq(expected_gamestate)
    end
  end
end