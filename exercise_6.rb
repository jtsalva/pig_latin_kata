# Write the program to reverse the above
# e.g. "Ethay uickqay oxfay umpedjay overway ethay azylay ogday" ->
#      "The quick fox jumped over the lazy dog"

def pig_latin_sentence_reverse(sentence)
  vowels = ["a", "e", "i", "o", "u"]

  normal_words = []
  sentence.split(" ").each { |word|
    if word.end_with? "way"
      normal_words << word.delete_suffix("way")
    else
      word.delete_suffix!("ay")

      if word.end_with? "qu"
        normal_words << "qu#{word[0..(word.length - 3)]}"
      elsif word.downcase.end_with? "th"
        normal_words << "th#{word[0]}"
      elsif !(vowels.include? word[-1])
        normal_words << "#{word[-1]}#{word[0..(word.length - 2)]}"
      end
    end
  }

  normal_words.reject { |word| word == "" }.join(" ").capitalize
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(
  pig_latin_sentence_reverse('Ethay ickquay oxf ay umpedjay overway ethay azylay ogday'),
  'The quick fox jumped over the lazy dog'
)
