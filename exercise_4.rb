# Develop your work so far to preserve the existing capitalisation of the word
# e.g. Dog  -> Ogday
#      cram -> amcray
#
# Assume words either start with a capital letter or don't — don't worry about
# other formats

def pig_latin(word)
    vowels = ["a", "e", "i", "o", "u"]
    consonants = ""

    return "#{word[2..word.length]}quay" if word[0..1] == "qu"

    word.chars.each { |letter|
        if !(vowels.include? letter)
            consonants += letter
        else
            break
        end
    }

    consonantLength = consonants.length

    result = consonantLength > 0 ? "#{word[(consonantLength)..word.length]}#{consonants}ay" : "#{word}way"

    if word[0] === word[0].capitalize
        result.capitalize
    else
        result
    end
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(pig_latin('Dog'), 'Ogday')
assert_equal(pig_latin('cram'), 'amcray')
