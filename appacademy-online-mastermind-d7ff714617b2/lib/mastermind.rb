class Code
  attr_reader :pegs
  PEGS = {
    R: "Red",
    G: "Green",
    B: "Blue",
    Y: "Yellow",
    O: "Orange",
    P: "Purple"}
    
  def initialize(pegs)
    @pegs = pegs
  end
  
  def self.random 
    colorArr = [:R, :G, :B, :Y, :O, :P]
    combination = []
    for i in 0..3
      combination << PEGS[colorArr[rand(5)]]
    end
    Code.new(combination)
  end
  
  def self.parse(guess)
    combination = guess.split("").map do |letter| 
      if PEGS.has_key?(letter.upcase.to_sym)
        PEGS[letter.upcase.to_sym] 
      else 
        raise "parse error"
      end 
    end 
    Code.new(combination)
  end
  
  def [](i)
    @pegs[i]
  end
  
  def exact_matches(code)
    matches = 0
    code.pegs.each_with_index do |color, index|
      matches += 1 if code[index] == @pegs[index]
    end 
    matches
  end
  
  def near_matches(code)
    near_matches = 0
    code.pegs.uniq do |color|
      near_matches += 1 if @pegs.include?(color)
    end 
    near_matches - exact_matches(code)
  end
end

class Game
  attr_reader :secret_code
end
