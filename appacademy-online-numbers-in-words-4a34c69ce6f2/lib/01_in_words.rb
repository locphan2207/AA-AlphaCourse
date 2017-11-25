class Fixnum 
  numberRead = "zero one two three four five six seven eight nine"
  $stringArray = numberRead.split(" ")
  $teenAndTy = [nil, nil, "twen", "thir", "for", "fif", "six", "seven", "eigh", "nine"]
  
  def readDigit(number)
    return "" if number == 0
    $stringArray[number]    
  end 
  
  def readTyTeen(number)
    if number < 10 
      readDigit(number)
    else
      if number == 10
        "ten"
      elsif number == 11
        "eleven"
      elsif number == 12
        "twelve"
      elsif number == 14
        "fourteen"
      elsif number < 20
        $teenAndTy[number%10] + "teen"
      else
        if number % 10 != 0
          $teenAndTy[number/10] + "ty " + readDigit(number%10)
        else
          $teenAndTy[number/10] + "ty"
        end
      end
    end
  end 
  
  def readHundred(number)
    if number >= 100
      $stringArray[number/100] + " hundred " + readTyTeen(number%100)
    else
      readTyTeen(number%100)
    end
  end
  
  def in_words 
    return "zero" if self == 0
    number = self
    result = ""
    while number > 0
      # if number == 0
        
      if number >= (10**12)
        result += readHundred(number/(10**12)) + " trillion "
        number = number % (10**12)
      elsif number >= (10**9)
        result += readHundred(number/(10**9)) + " billion "
        number = number % (10**9)
      elsif number >= (10**6)
        result += readHundred(number/(10**6)) + " million "
        number = number % (10**6)
      elsif number >= (10**3)
        result += readHundred(number/(10**3)) + " thousand "
        number = number % (10**3)
      else
        result += readHundred(number)
        number = 0
      end 
    end
    return result.chop if result[result.length-1] == " "
    result
  end
end