# Develop your work so far to treat 'qu' as a special case, so that those words
# end in 'quay'
# e.g. quick -> ickquay
#      quilt -> iltquay
#      qat   -> atqay

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
    consonantLength > 0 ? "#{word[(consonantLength)..word.length]}#{consonants}ay" : "#{word}way"
end

## Tests:

require_relative './helpers/assert_equal'
assert_equal(pig_latin('quick'), 'ickquay')
assert_equal(pig_latin('quilt'), 'iltquay')
assert_equal(pig_latin('qat'), 'atqay')
