class Board
  attr_reader :grid
  def initialize(input_grid = [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]])
    @grid = input_grid
  end
  
  def empty?(pos)
    return true if @grid[pos[0]][pos[1]] == nil 
    false
  end
  
  def place_mark(pos, mark)
    if empty?(pos)
      @grid[pos[0]][pos[1]] = mark
    else
      raise "The position is not empty"
    end
  end
  
  def winner
    for row in 0..2
      return @grid[row][0] if @grid[row][0] == @grid[row][1] && @grid[row][0] == @grid[row][2] && @grid[row][0] != nil 
    end 
    for col in 0..2
      return @grid[0][col] if @grid[0][col] == @grid[1][col] && @grid[0][col] == @grid[2][col] && @grid[0][col] != nil
    end
    return @grid[0][0] if @grid[0][0] == @grid[1][1] && @grid[0][0] == @grid[2][2]
    return @grid[0][2] if @grid[0][2] == @grid[1][1] && @grid[0][2] == @grid[2][0]
    nil
  end
  
  def over?
    if @grid == [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
      false
    else 
      if winner == :O || winner == :X
        true 
      elsif !@grid[0].include?(nil) && !@grid[1].include?(nil) && !@grid[2].include?(nil)
        true
      else 
        false
      end
    end
  end
end
