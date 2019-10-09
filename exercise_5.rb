# Develop your work so far to handle sentences
# e.g. "The quick fox jumped over the lazy dog" ->
#      "Ethay ickquay oxfay umpedjay overway ethay azylay ogday"

def pig_latin_sentence(sentence)
  pig_sentence = ""
  sentence.split(" ").each { |word|
    pig_sentence += "#{pig_latin(word)} "
  }
  
  pig_sentence[0..(pig_sentence.length - 2)]
end

def pig_latin(word)
  vowels = ["a", "e", "i", "o", "u"]
  consonants = ""

  return "#{word[2..word.length]}quay" if word[0..1] == "qu"

  word.chars.each { |letter|
    !(vowels.include? (letter)) ? consonants += letter : break
  }

  consonantLength = consonants.length

  result = consonantLength > 0 ? "#{word[(consonantLength)..word.length]}#{consonants}ay" : "#{word}way"

  word[0] === word[0].capitalize ? result.capitalize : result
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(
  pig_latin_sentence('The quick fox jumped over the lazy dog'),
  'Ethay ickquay oxfay umpedjay overway ethay azylay ogday'
)
