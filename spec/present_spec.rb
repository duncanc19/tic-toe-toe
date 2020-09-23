require_relative "../present"



context Present do
    describe "When an empty game is passed to Present" do
        it "outputs an empty grid" do 
            # Arrange
            presenter = Present.new
            game = Game.new
            # Act
            display = presenter.present_game(game)
            # Assert
            expect(display).to eq("---\n---\n---")
        end 
    end
end