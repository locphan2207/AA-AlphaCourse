# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  answer = rand(1..100)
  userGuess = nil
  guessedNumber = []
  while userGuess != answer 
    # Ask userinput:
    print "Your previous guesses: "
    p guessedNumber
    puts "Guess a number:"
    print "> "
    userGuess = gets.chomp.to_i
    guessedNumber << userGuess # tracking guessed number 
    if userGuess == answer
      puts "You got the answer!!!"
      puts " The number is #{answer}. You guessed #{guessedNumber.length} times."
    else
      if userGuess > answer 
        compare = "too high"
      elsif userGuess < answer 
        compare = "too low"
      end
      puts "The number is #{compare}"
    end
  end
end

def shuffle
  puts "Enter the file name:"
  print "> "
  user = gets.chomp.to_i
  lines = File.readlines(user + '.txt')
  lines.shuffle!
  File.open(user + "-shuffled.txt", "w") do |f| 
    lines.each {|line| f.puts(line)}
    f.close
  end
end