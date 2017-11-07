def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string, times = 2)
  result = string
  (times-1).times {|times| result += " " + string}
  result
end

def start_of_word(string, index)
  string[0..index-1]
end

def first_word(string)
  string.split[0]
end

def titleize(string)
  words = string.capitalize.split
  lil_word = ["and", "or", "the", "over", "to", "the", "a", "but"]
  words.map! do |word|
    if lil_word.include?(word)
      word
    else
      word.capitalize
    end
  end
  words.join(" ")
end
