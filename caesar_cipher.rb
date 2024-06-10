def shift_character_to_n (character, min_range, max_range, shift)
  # PSEUDOCODE:
  # If the shift's value is positive, it shifts to right
  #   Loop to n times (shift)
  #     If the character already reached the max range then
  #       go back to min range
  #     else
  #       increment the character (decimal) by 1
  #
  # Else (if the shift's value is negative, it shifts to left)
  #   Loop to n times (shift) (since shift is negative, converted it to absolute)
  #     If the character already reached the minimum range then
  #       go to max range
  #     else 
  #       decrement the character by 1
  #
  # return Character

  if shift > 0
    shift.times do
      if character == max_range 
        character = min_range
        next
      else
        character += 1
      end
    end
  else
    shift.abs.times do
      if character == min_range 
        character = max_range
        next
      else
        character -= 1
      end
    end
  end

  character
end

def is_character_valid? (character)
  char_decimal = character.ord

  # If character is within small letters
  if char_decimal >= 97 and char_decimal <= 122
    return {
      status: true,
      range: [97, 122]
    }
  # ELse if character is within CAPITAL LETTERS
  elsif char_decimal >= 65 and char_decimal <= 90
    return {
      status: true,
      range: [65, 90]
    }
  else
    return {
      status: false
    }
  end
end

def caesar_cipher(string, shift = 1) 
  ciphered_text = ""

  string.split('').map do |character|
    decimal_character = character.ord
    response = is_character_valid?(character)

    # If the character is not within a-z or A-Z then just skip that.
    unless (decimal_character >= 65 and decimal_character <= 90) or (decimal_character >= 97 and decimal_character <= 122)
      ciphered_text += character
      next
    end

    # Here is the action, This character is being shifted.
    if response[:status]
      ciphered_text += (shift_character_to_n(decimal_character, response[:range][0], response[:range][1], shift)).chr
    end
  end

  ciphered_text
end

puts caesar_cipher("What a string!", 5) # => "Bmfy f xywnsl!"
puts caesar_cipher("What a string!", -5) # => "Rcvo v nomdib!"
puts caesar_cipher("TOP is the Best!!!", 502) # => "BWX qa bpm Jmab!!!"
puts caesar_cipher("BWX qa bpm Jmab!!!", -502) # => "TOP is the Best!!!"
puts caesar_cipher("No ShIfT?!") # => "Op TiJgU?!"