def reverser(&proc)
  string = proc.call
  words = string.split
  words.map {|word| word.reverse}.join(" ")
end

def adder(num = 1, &proc)
  num + proc.call
end

def repeater(times = 1, &proc)
  times.times do
    proc.call
  end
end
