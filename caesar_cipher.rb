# frozen_string_literal: true
require_relative('lib/cipher')

# Function to cipher string
def caesar_cipher(string, shift = 1)
  Cipher.new.cipher(string, shift)
end

puts caesar_cipher("What a string!", 5) # => "Bmfy f xywnsl!"
puts caesar_cipher("What a string!", -5) # => "Rcvo v nomdib!"
puts caesar_cipher("TOP is the Best!!!", 502) # => "BWX qa bpm Jmab!!!"
puts caesar_cipher("BWX qa bpm Jmab!!!", -502) # => "TOP is the Best!!!"
puts caesar_cipher("No ShIfT?!") # => "Op TiJgU?!"
