# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi
  attr_reader :towers
  $start = ""
  $destination = ""
  
  def initialize
    @towers = [[3,2,1],[],[]]
  end
  
  def valid_move?(start, destination)
    # true if start pile is not empty and destination pile is not full
    if (@towers[start].length != 0) && (@towers[destination].length < 3)
      if @towers[destination] == [] || @towers[destination][@towers[destination].length-1] > @towers[start][@towers[start].length-1]
        true
      end
    else
      false
    end
  end

  def move(start, destination)
    @towers[destination][@towers[destination].length] = @towers[start][@towers[start].length-1] # copying top disc 
    @towers[start].pop #delete the top disc
  end

  def won?
    return true if @towers[1] == [3,2,1] || @towers[2] == [3,2,1]
    false
  end

  def render
    puts "Pile 0 | " + @towers[0].to_s
    puts "Pile 1 | " + @towers[1].to_s
    puts "Pile 2 | " + @towers[2].to_s
  end

  def play 
    p "Start playing:"
    while !won?
      render
      while true
        puts "Enter start pile: "
        start = gets.chomp.to_i
        puts "Enter destination pile: "
        destination = gets.chomp.to_i
        if destination < 3 && start < 3
          break
        else 
          puts "Please enter pile position < 3!!"
        end
      end
      if valid_move?(start, destination)
        move(start, destination)
      else 
        puts "The move is not valid. Please re-input:"
      end
    end
    puts "You WIN!"
  end
end
