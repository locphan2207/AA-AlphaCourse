def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(array)
  sum = 0
  array.each {|num| sum += num}
  sum
end

def multiply(array)
  result = 1
  array.each {|num| result *= num}
  result
end

def power(num, pow)
  num ** pow
end

def factorial(num)
  return 1 if num < 2
  result = 1
  (1..num).each {|num| result *= num}
  result
end
