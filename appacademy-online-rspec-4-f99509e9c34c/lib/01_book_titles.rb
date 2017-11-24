class Book
  # TODO: your code goes here!
  attr_reader :title
  def title= (title) #this is def also assigning to private variable title 
    words = title.capitalize.split(" ")
    lil_word = ["and", "or", "the", "over", "to", "the", "a", "but", "in", "of", "an"] #updating
    words.map! do |word| 
      if !lil_word.include?(word)
        word.capitalize 
      else
        word
      end
    end
    @title = words.join(" ")
  end
end
