# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  result = {}
  str.split.each {|word| result[word] = word.length}
  result
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.each {|key, value| return key if value == hash.values.max}
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  # (older.to_a + newer.to_a).to_h #Attempted to use to_h but it didnt work
  newer.each {|key, value| older[key] = value}
  older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hash = Hash.new(0)
  word.chars {|letter| hash[letter] += 1}
  hash
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  hash = Hash.new(0)
  arr.each {|el| hash[el] = 1} #value doesnt matter this case
  hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash = Hash.new(0)
  numbers.each do |num|
    if num % 2 == 0
      hash[:even] +=1
    else
      hash[:odd] += 1
    end
  end
  hash
end

# Define a method that, given a string, returns the most common vowel. If
# there's a tie, return the vowel that occurs earlier in the alphabet. Assume
# all letters are lower case.
def most_common_vowel(string)
  hash = Hash.new(0)
  vowels = "aeiou".chars
  string.chars do |letter|
    if vowels.include?(letter)
      hash[letter] += 1
    end
  end
  #Sort based on key then find max based on value
  #It returns as array [key, value]. so we take the 1st index:
  hash.sort_by {|key, value| key}.max_by {|key, value| value}[0]
  # could also use .last method after sort to find max
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  fallWinterStudent = (students.select {|name, month| month > 6}).keys
  result = []
  fallWinterStudent.each_with_index do |student1, index|
    #We pair each student with other students from the right side of array:
    theRightSide = fallWinterStudent.drop(index + 1) #the other students from right side of array
    theRightSide.each {|student2| result << [student1, student2]}
  end
  result
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  hash = Hash.new(0)
  specimens.each {|speci| hash[speci] += 1}
  hash.values.length**2 * hash.min_by{|k, v| v}[1] / hash.max_by{|k, v| v}[1]
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  hash1 = character_count(normal_sign)
  hash2 = character_count(vandalized_sign)
  # Check if the number of each char in vandalized sign is more than what it has in normal sign:
  hash2.each {|key, value| return false if value > hash1[key]}
  true
end

def character_count(str)
  hash = Hash.new(0)
  str.downcase.each_char {|char| hash[char] += 1}
  hash
end
