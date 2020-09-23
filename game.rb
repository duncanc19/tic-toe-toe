class Game

  attr_accessor :game_state

  def initialize
    @game_state = [['','', ''],['','', ''],['','', '']]
  end

  def add_move(row, col)
    @game_state = [['x','', ''],['','', ''],['','', '']]
  end
end