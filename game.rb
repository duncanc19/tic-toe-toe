class Game

  attr_accessor :game_state, :current_player, :verified_move
  
  def initialize
    @game_state = [['', '', ''],['', '', ''],['', '', '']]
    @current_player = 'x'
  end

  def add_move(row, col)
    @game_state[row][col] = @current_player
  end

  def next_player
    player_array = {'x' => 'o', 'o' => 'x'}
    @current_player = player_array[@current_player]
  end 

  # def play_move
  #   add_move(@verified_move[0], @verified_move[1])
  # end

end