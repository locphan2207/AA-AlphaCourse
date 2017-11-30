class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark
  
  def initialize(name)
    @name = name
  end
  
  def display(board)
    @board = board
  end
  
  def get_move 
    # Checking rows:
    @board.grid.each_with_index do |row, idx1|
      if row.include?(nil) && row.count(@mark) == 2 #if there are 2 comp marks and an empty slot
        row.each_with_index {|col, idx2| return [idx1, idx2] if col == nil}
      end 
    end 
    
    #Checking columns:
    @board.grid.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2| 
        if col == nil #find empty slot
          compMark_count = 0
          for i in 0..2 #check the column of the empty slot
            compMark_count +=1 if @board.grid[i][idx2] == @mark #count the comp marks
          end
          return [idx1, idx2] if compMark_count == 2 #place winning mark if there are 2 comp marks
        end
      end 
    end 
    
    #Checking diogonal:
    compMark_count = 0
    nil_count = 0
    pos = nil
    for i in 0..2
      if @board.grid[i][i] == @mark 
        compMark_count +=1
      elsif @board.grid[i][i] == nil 
        nil_count +=1
        pos = [i, i]
      end 
    end 
    return pos if compMark_count == 2 && nil_count == 1
    
    compMark_count = 0
    nil_count = 0
    for i in 0..2
      for j in (0..2).reverse_each
        if @board.grid[i][i] == @mark 
          compMark_count +=1
        elsif @board.grid[i][i] == nil 
          nil_count +=1
          pos = [i, i]
        end
      end
    end  
    return pos if compMark_count == 2 && nil_count == 1
    
    #When no winning move 
    empty_positions = []
    for i in 0..2
      for j in 0..2
        if @board.grid[i][j] == nil 
          empty_positions << [i, j]
        end 
      end 
    end 
    return empty_positions[rand(empty_positions.length-1)]
  end
end
