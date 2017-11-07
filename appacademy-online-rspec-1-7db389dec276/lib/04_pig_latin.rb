def translate_word(string)
  vowels = "aeiou"
  two_consonants = "bl br ch cl	cr dr fl fr gl gr pl pr sc sh sk sl sm sn sp st sw th tr tw wh wr qu"
  three_consonants = "sch scr shr sph spl spr squ str thr"
  if vowels.include?(string[0])
    string + "ay"
  elsif three_consonants.include?(string[0..2])
    string[3..string.length-1] + string[0..2] + "ay"
  elsif two_consonants.include?(string[0..1])
    string[2..string.length-1] + string[0..1] + "ay"
  else
    string[1..string.length-1] + string[0] + "ay"
  end
end

def translate(string)
  words = string.split
  words.map! {|word| translate_word(word)}
  words.join(" ")
end
