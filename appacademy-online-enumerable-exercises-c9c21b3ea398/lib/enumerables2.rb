require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  arr.reduce(0) {|acc, el| acc + el}
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  long_strings.each {|string| return false if !string.include?(substring)}
  true
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  arr = string.chars.select {|char| char.ord <= 'z'.ord && char.ord >= 'a'.ord}
  #Look at each word, then check if it is included in the rest of the array
  result = arr.select.with_index {|word, index| (arr.reject.with_index {|word2, index2| index == index2}).include?(word)}
  result.uniq.sort
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  arr = string.split(" ")
  #remove longest word out of array and save the removed element into result
  #then find the longest word again after removing the 1st longest word
  result = [arr.delete(arr.max_by(&:length))]
  result << arr.max_by(&:length)
  result
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  alphabet = ("a".."z")
  alphabet.select {|letter| !string.include?(letter)}
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select {|year| not_repeat_year?(year)}
end

def not_repeat_year?(year)
  arr = year.to_s.chars #array of digit in char
  arr.uniq.join("") == year.to_s
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  arr = songs.select {|song| no_repeats?(song, songs)}
  arr.uniq
end

def no_repeats?(song_name, songs)
  for i in 0..songs.length-2
    return false if songs[i] == song_name && songs[i] == songs[i+1]
  end
  true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  words = string.split
  words.each_with_index do |word, index|
    #Remove punctuation:
    newWord = ""
    word.chars do |char|
      if char.ord <= 'z'.ord && char.ord >= 'a'.ord
        newWord += char
      end
    end
    words[index] = newWord
  end
  #Calculate all c distances and find the minimum one:
  distances = []
  words.each {|word| distances << c_distance(word)}
  words.each {|word| return word if c_distance(word) == distances.min}
  ""
end

def c_distance(word)
  word.chars.reverse_each.with_index {|char, index| word.length - index if char == "c"}
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  startIndex = endIndex = 0
  result = []
  arr.each_with_index do |num, index|
    # Update endIndex if the number is repeating:
    if arr[index] == arr[index + 1]
      endIndex = index + 1
    else
    # If it stops repeating, or not repeat:
      if startIndex < endIndex #to save result if there is repeated number right before
        result << [startIndex, endIndex]
      end
      # Reset index:
      startIndex = endIndex = index + 1
    end
  end
  result
end
