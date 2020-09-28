require_relative "../check_win"

context CheckWin do
  describe "given an unfinished game" do
      it "returns false" do
        # Arrange
        game = Game.new
        # Act
        result = CheckWin.check_rows(game) 
        # Assert  
        expect(result).to eq(false)  
      end
  end
  describe "given an unfinished game" do
    it "returns false" do
      # Arrange
      game = Game.new
      game.add_move(0,0)
      # Act
      result = CheckWin.check_rows(game) 
      # Assert  
      expect(result).to eq(false)  
    end
  end
  describe "given a complete top row (x's)" do
    it "returns true" do
      # Arrange
      game = Game.new
      game.add_move(0,0)
      game.add_move(0,1)
      game.add_move(0,2)
      # Act
      result = CheckWin.check_rows(game) 
      # Assert  
      expect(result).to eq(true)  
    end
  end

  describe "given a complete middle row (x's)" do
    it "returns true" do
      # Arrange
      game = Game.new
      game.add_move(1,0)
      game.add_move(1,1)
      game.add_move(1,2)
      # Act
      result = CheckWin.check_rows(game) 
      # Assert  
      expect(result).to eq(true)  
    end
  end

  describe "given a complete bottom row (x's)" do
    it "returns true" do
      # Arrange
      game = Game.new
      game.add_move(2,0)
      game.add_move(2,1)
      game.add_move(2,2)
      # Act
      result = CheckWin.check_rows(game) 
      # Assert  
      expect(result).to eq(true)  
    end
  end

  describe "given a complete bottom row (o's)" do
    it "returns true" do
      # Arrange
      game = Game.new
      game.next_player
      game.add_move(2,0)
      game.add_move(2,1)
      game.add_move(2,2)
      # Act
      result = CheckWin.check_rows(game) 
      # Assert  
      expect(result).to eq(true)  
    end
  end
end 