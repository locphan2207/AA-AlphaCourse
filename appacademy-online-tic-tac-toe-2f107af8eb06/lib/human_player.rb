class HumanPlayer
  attr_reader :name, :mark
  
  def initialize(name)
    @name = name
  end
  
  def display(board)
    p board
  end 
  
  def get_move
    puts "Where would you like to move? (row, col)"
    return gets.chomp.split(",").map {|token| token.to_i}
  end
end
