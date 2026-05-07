#!/usr/bin/env ruby

class CaesarCipher
  def initialize(shift)
    @shift = shift
  end

  def encrypt(message)
    cipher(message, @shift)
  end

  def decrypt(message)
    cipher(message, -@shift)
  end

  private

  def cipher(message, shift)
    result = ""

    message.each_char do |char|
      if char =~ /[a-z]/
        result += ((char.ord - 'a'.ord + shift) % 26 + 'a'.ord).chr
      elsif char =~ /[A-Z]/
        result += ((char.ord - 'A'.ord + shift) % 26 + 'A'.ord).chr
      else
        result += char
      end
    end

    result
  end
end
