# frozen_string_literal: true
require('./lib/cipher')

# Test Cases
describe Cipher do
  cipher = Cipher.new

  describe '#is_character_valid? (Private Method)' do
    it 'Must return a Hash' do
      expect(cipher.is_character_valid?('.').class).to eql(Hash)
    end

    test_1 = { status: false }
    it 'Must return a Hash with a key status set to \'false\' when passed an out of range character (a-zA-Z)' do
      expect(cipher.is_character_valid?('.')).to eql(test_1)
    end

    test_2 = { status: true, range: [97, 122] }
    it 'Must return a hash with a key status set to \'true\' and range set to [97, 122] (Small letters)' do
      expect(cipher.is_character_valid?('b')).to eql(test_2)
      expect(cipher.is_character_valid?('h')).to eql(test_2)
      expect(cipher.is_character_valid?('A')).to_not eql(test_2)
    end

    test_3 = { status: true, range: [65, 90] }
    it 'Must return a hash with a key status set to \'true\' and range set to [65, 90] (Big letters)' do
      expect(cipher.is_character_valid?('B')).to eql(test_3)
      expect(cipher.is_character_valid?('h')).to_not eql(test_3)
      expect(cipher.is_character_valid?('A')).to eql(test_3)
    end
  end

  describe '#shift_character_to_n (Private Method)' do
    it 'Must return a Integer representation of character (Ordinal)' do
      expect(cipher.shift_character_to_n('a'.ord, 97, 122, 5).class).to eql(Integer)
    end
    it 'Must shift the character 5 times to right side (Ex: a shift(5) = f)' do
      expect(cipher.shift_character_to_n('a'.ord, 97, 122, 5)).to eql('f'.ord)
    end
    it 'Can accept negative shift value, shifting to the left side (Ex: a shift(-5) = v)' do
      expect(cipher.shift_character_to_n('a'.ord, 97, 122, -5)).to eql('v'.ord)
    end
    it 'Wraps around when shift value went off to the min and max range (alphabet has length of 26)' do
      expect(cipher.shift_character_to_n('a'.ord, 97, 122, 502)).to eql('i'.ord)
    end
  end

  describe '#cipher (Private Method)' do
    it 'Must return a string' do
      caesar = Cipher.new
      expect(caesar.cipher('What a string!', 5).class).to eql(String)
    end

    it 'Must accept string even without shift value (Default shift is set to 1)' do
      caesar = Cipher.new
      expect(caesar.cipher('No ShIfT?!')).to eql('Op TiJgU?!')
    end

    it 'Must work with other methods (#is_character_valid?, #shift_character_to_n)' do
      caesar = Cipher.new
      expect(caesar.cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')

      caesar = Cipher.new
      expect(caesar.cipher('TOP is the Best!!!', 502)).to eql('BWX qa bpm Jmab!!!')
      
      caesar = Cipher.new
      expect(caesar.cipher('BWX qa bpm Jmab!!!', -502)).to eql('TOP is the Best!!!')
    end
  end
end