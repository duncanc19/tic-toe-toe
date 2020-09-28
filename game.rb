class Game

  attr_accessor :game_state, :current_player
  player_array = {:x=>'o', :o=> 'x'}
  def initialize
    @game_state = [['','', ''],['','', ''],['','', '']]
    @current_player = "x"
  end



  def add_move(row, col)
    return false if row > 2 || col > 2
    return false if @game_state[row][col] == 'x' 
    @game_state[row][col] = 'x'
  end

  def next_player
    @current_player = player_array[@current_player]
  end 
end