ALPHABET = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
            't', 'u', 'v', 'w', 'x', 'y', 'z' ]
require 'pry'
def caesar_encode(str, offset)
  sent_arr = str.split('')
  sent_arr.each_with_object("") do |char, str|
    re_capital = char.upcase == char
    char = char.downcase
    char = shift_letter(char, offset) if ALPHABET.include?(char)
    char = char.upcase if re_capital
    str << char
  end
end

def caesar_decode(str, offset)
  sent_arr = str.split('')
  sent_arr.each_with_object("") do |char, str|
    re_capital = char.upcase == char
    char = char.downcase
    char = unshift_letter(char, offset) if ALPHABET.include?(char)
    char = char.upcase if re_capital
    str << char
  end
end

def unshift_letter(str, offset)
  initial_idx = ALPHABET.index(str)
  offset %= 26
  new_idx = initial_idx - offset
  str = ALPHABET[new_idx]
  str
end

def shift_letter(str, offset)

  initial_idx = ALPHABET.index(str)
  new_idx = (initial_idx + offset) % 26
  str = ALPHABET[new_idx]
  str
end
