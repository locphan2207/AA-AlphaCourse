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
  
  def doMath(operator, index)
    case operator
    when :+
      @value = @stack[index-2] + @stack[index-1]
    when :-
      @value = @stack[index-2] - @stack[index-1]
    when :*
      @value = @stack[index-2] * @stack[index-1]
    when :/
      @value = @stack[index-2].to_f / @stack[index-1].to_f
    end
    # Delete Operator, Operand. Save the operation's result
    @stack[index-2] = @value #save result
    @stack.delete_at(index) #delete operator
    @stack.delete_at(index-1) #delete operand
  end
  
  def plus
    if enoughNumber? 
      doMath(:+, @stack.length) #index for this case (only 2 numbers) is the length
    end
  end
  
  def minus 
    if enoughNumber?
      doMath(:-, @stack.length)
    end
  end
  
  def times 
    if enoughNumber?
      doMath(:*, @stack.length)
    end
  end
  
  def divide 
    if enoughNumber?
      doMath(:/, @stack.length)
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
    while @stack.length > 1 #keep doing math until one number is left
      @stack.each_with_index do |token, index|
        if token.class == Symbol  #start doing math when we meet the operator symbol
          doMath(token, index)
        else
          next
        end
        break
      end
    end
    @value
  end
  
end
