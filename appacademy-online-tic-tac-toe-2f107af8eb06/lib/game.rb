require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :current_player, :player1, :player2
  attr_accessor :board 
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @board = Board.new
  end
  
  def play_turn
    @board.place_mark(@current_player.get_move, @current_player.mark)
    switch_players!
    @current_player.display(@board)
  end
  
  def switch_players!
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  
  
end
