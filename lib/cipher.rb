# frozen_string_literal: true

# Caezar Cipher Class
class Cipher
  def initialize
    @result = ''

    self
  end

  # private

  def cipher(string, shift = 1)
  
    string.split('').map do |character|
      decimal_character = character.ord
      data = is_character_valid?(character)
  
      # Here is the action, This character is being shifted.
      if data[:status]
        @result += (shift_character_to_n(decimal_character, data[:range][0], data[:range][1], shift)).chr
      else
        @result += character
      end
    end
  
    @result
  end

  def shift_character_to_n(character, min_range, max_range, shift)
    shift.abs.times do
      if character == max_range && shift.positive?
        character = min_range
        next
      elsif character == min_range && shift.negative?
        character = max_range
        next
      else
        shift.negative? ? character -= 1 : character += 1
      end
    end

    character
  end
  
  def is_character_valid?(character)
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
end
