# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  str.each_char do |chr|
    if chr == chr.downcase
      str.delete!(chr)
    end
  end
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  return str[str.length/2] if str.length % 2 != 0
  str[str.length/2-1] + str[str.length/2]
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u) #a different notation to write ['a','e','i','o','u']
def num_vowels(str)
  result = 0
  str.each_char do |chr|
    VOWELS.each do |vow|
      if chr == vow
        result +=1
      end
    end
  end
  result
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  result = 1
  (1..num).each {|num| result *=num}
  result
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  result = ""
  arr.each_index do |index|
    if index != arr.length-1
      result += (arr[index] + separator)
    else
      result += arr[index]
    end
  end
  result
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  for i in 0..str.length-1
    if i % 2 != 0
      str[i] = str[i].upcase
    else
      str[i] = str[i].downcase
    end
  end
  str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  arr = str.split
  arr.each do |word|
    if word.length >= 5
      word.reverse!
    end
  end
  arr.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  result = []
  (1..n).each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "fizzbuzz"
    elsif num % 3 == 0
      result << "fizz"
    elsif num % 5 == 0
      result << "buzz"
    else
      result << num
    end
  end
  result
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  result = []
  for i in (0..arr.length-1).reverse_each #maybe this is cheating?
    result << arr[i]
  end
  result
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  return false if num <= 1
  for i in 2..num/2
    if num % i == 0
      return false
    end
  end
  true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  result = []
  for i in 1..num
    if num % i == 0
      result << i
    end
  end
  result.sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  factors = factors(num)
  result = []
  factors.each do |fac|
    if prime?(fac)
      result << fac
    end
  end
  result
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  oddcount = evencount = 0
  arr.each do |num|
    if num % 2 == 0
      evencount +=1
    else
      oddcount +=1
    end
    if oddcount > 1 || evencount > 1
      break
    end
  end
  if oddcount > 1
    arr.each do |num| return num if num % 2 == 0 end
  elsif evencount > 1
    arr.each do |num| return num if num % 2 != 0 end
  end
end
