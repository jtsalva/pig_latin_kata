# Develop your proram to handle multiple consonants at the start of words.
#
# The rule is:
# If the word starts with one or more consonants, move them to the end.
# e.g. cram     -> amcray
#      sprinkle -> inklespray
#
# Still assume the words are lowercase.


def pig_latin(word)
    vowels = ["a", "e", "i", "o", "u"]
    consonants = ""

    word.chars.each { |letter|
        if !(vowels.include? letter)
            consonants += letter
        else
            break
        end
    }

    consonantLength = consonants.length
    consonantLength > 0 ? "#{word[(consonantLength)..word.length]}#{consonants}ay" : "#{word}way"
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(pig_latin('cram'), 'amcray')
assert_equal(pig_latin('sprinkle'), 'inklespray')
assert_equal(pig_latin('dog'), 'ogday')
assert_equal(pig_latin('up'), 'upway')
