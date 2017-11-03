# Given an array of unique integers ordered from least to greatest, write a
# method that returns an array of the integers that are needed to
# fill in the consecutive set.

def missing_numbers(nums)
  result = []
  (nums[0]..nums[nums.length-1]).each {|num| result << num if !nums.include?(num)}
  result
end

# Write a method that given a string representation of a binary number will
# return that binary number in base 10.
#
# To convert from binary to base 10, we take the sum of each digit multiplied by
# two raised to the power of its index. For example:
#   1001 = [ 1 * 2^3 ] + [ 0 * 2^2 ] + [ 0 * 2^1 ] + [ 1 * 2^0 ] = 9
#
# You may NOT use the Ruby String class's built in base conversion method.

def base2to10(binary)
  result = 0
  base = 0
  binary.to_s.reverse.each_char do |digit|
    result += digit.to_i * 2**base
    base +=1
  end
  result
end

class Hash

  # Hash#select passes each key-value pair of a hash to the block (the proc
  # accepts two arguments: a key and a value). Key-value pairs that return true
  # when passed to the block are added to a new hash. Key-value pairs that return
  # false are not. Hash#select then returns the new hash.
  #
  # Write your own Hash#select method by monkey patching the Hash class. Your
  # Hash#my_select method should have the functionailty of Hash#select described
  # above. Do not use Hash#select in your method.

  def my_select(&prc)
    hash = {}
    self.each {|key, value| hash[key] = value if prc.call(key, value)}
    hash
  end

end

class Hash

  # Hash#merge takes a proc that accepts three arguments: a key and the two
  # corresponding values in the hashes being merged. Hash#merge then sets that
  # key to the return value of the proc in a new hash. If no proc is given,
  # Hash#merge simply merges the two hashes.
  #
  # Write a method with the functionality of Hash#merge. Your Hash#my_merge method
  # should optionally take a proc as an argument and return a new hash. If a proc
  # is not given, your method should provide default merging behavior. Do not use
  # Hash#merge in your method.

  def my_merge(hash, &prc)
    prc = Proc.new { |k, oldval, newval| newval } if (prc == false || prc == nil)
    newHash = {}

    self.each do |key, value|
      if hash[key] != nil
        newHash[key] = prc.call(key, value, hash[key])
      else
        newHash[key] = value
      end
    end

    hash.each do |key, value|
      newHash[key] = value if newHash[key] == nil
    end

    newHash
  end

end

# The Lucas series is a sequence of integers that extends infinitely in both
# positive and negative directions.
#
# The first two numbers in the Lucas series are 2 and 1. A Lucas number can
# be calculated as the sum of the previous two numbers in the sequence.
# A Lucas number can also be calculated as the difference between the next
# two numbers in the sequence.
#
# All numbers in the Lucas series are indexed. The number 2 is
# located at index 0. The number 1 is located at index 1, and the number -1 is
# located at index -1. You might find the chart below helpful:
#
# Lucas series: ...-11,  7,  -4,  3,  -1,  2,  1,  3,  4,  7,  11...
# Indices:      ... -5, -4,  -3, -2,  -1,  0,  1,  2,  3,  4,  5...
#
# Write a method that takes an input N and returns the number at the Nth index
# position of the Lucas series.

def lucas_numbers(n)
  lucas = {0=>2, 1=>1}
  if n > 1
    index = 2
    while (index <= n)
      lucas[index] = lucas[index-1] + lucas[index-2]
      index +=1
    end
    return lucas[n]
  elsif n < 0
    index = -1
    while (index >= n)
      lucas[index] = lucas[index+2] - lucas[index+1]
      index -=1
    end
    return lucas[n]
  else
    return lucas[n]
  end
end

# A palindrome is a word or sequence of words that reads the same backwards as
# forwards. Write a method that returns the longest palindrome in a given
# string. If there is no palindrome longer than two letters, return false.

def longest_palindrome(string)
  countArr = []
  charArr = string.downcase.chars
  charArr.each_with_index do |char, index|
    if charArr[index] == charArr[index+1] || charArr[index] == charArr[index+2]
      left = index
      right = charArr[index] == charArr[index+1] ? index+1 : index+2
      count = charArr[index] == charArr[index+1] ? 0 : 1
      countArr << countPalindrome(charArr, left, right, count)
    end
  end
  return false if countArr.length == 0 || countArr.max <= 2
  countArr.max
end

def countPalindrome(charArr, left, right, count)
  result = count
  while (left > -1 && right < charArr.length && charArr[left] == charArr[right]) # Count length
    result += 2
    left -=1
    right +=1
  end
  result
end
