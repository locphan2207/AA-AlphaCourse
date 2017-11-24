class RPNCalculator
  # TODO: your code goes here!
  attr_reader :value, :stack #private variables
  
  def initialize
    @stack = []
    @value = 0
  end
  
  def push(newValue)
    @stack.push(newValue)
  end
  
  def enoughNumber?
    return true if @stack.length > 1 
    raise 'calculator is empty' #exception handling
    false
  end
  
  def plus
    if enoughNumber? 
      @value = @stack[@stack.length-2] + @stack[@stack.length-1]
      @stack[@stack.length-2] = @value
      @stack.pop
    end
  end
  
  def minus 
    if enoughNumber?
      @value = @stack[@stack.length-2] - @stack[@stack.length-1]
      @stack[@stack.length-2] = @value
      @stack.pop
    end
  end
  
  def times 
    if enoughNumber?
      @value = @stack[@stack.length-2] * @stack[@stack.length-1]
      @stack[@stack.length-2] = @value
      @stack.pop
    end
  end
  
  def divide 
    if enoughNumber?
      @value = @stack[@stack.length-2].to_f / @stack[@stack.length-1].to_f #force to float type
      @stack[@stack.length-2] = @value
      @stack.pop
    end
  end
  
  def tokens(string)
    tokens = string.split(" ")
    @stack = tokens.map do |token| 
      if token.ord >= '0'.ord && token.ord <= '9'.ord
        token.to_i
      else
        token.to_sym
      end
    end
  end
  
  def evaluate(string)
    tokens(string)
    while @stack.length > 1
      @stack.each_with_index do |token, index|
        case token
        when :+
          @value = @stack[index-2] + @stack[index-1]
        when :-
          @value = @stack[index-2] - @stack[index-1]
        when :*
          @value = @stack[index-2] * @stack[index-1]
        when :/
          @value = @stack[index-2].to_f / @stack[index-1].to_f
        else
          next
        end
        @stack[index-2] = @value
        @stack.delete_at(index)
        @stack.delete_at(index-1)
        break
      end
    end
    @value
  end
  
end
