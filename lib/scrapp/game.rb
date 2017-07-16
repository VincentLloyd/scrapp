module Scrapp
  class Scrabble
    VALID_CHARS = [*'A'..'Z', '!', '*'].freeze

    LETTER_VALUES = {
      'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
      'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
      'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
      'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
      'Q' => 10, 'R' => 1, 'S' => 1, 'T' => 1,
      'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
      'Y' => 4, 'Z' => 10
    }.freeze

    attr_accessor :word

    def initialize(word)
      if valid?(word)
        $stdout.write "\e[14;23H"
        puts "\e[1m\e[32m#{word}\e[0m"
        $stdout.write "\e[15;23H"
        puts "\e[1m\e[32mVALID!\e[0m"
        @word = word 
      end
    end

    def valid?(word)
      if word.chars.all? { |char| VALID_CHARS.include? char.upcase }
        word.scan(/(\W{3,})/).length.zero? ? true : false
      else
        false
      end
    end

    def raise_error(error_code)
    end

    def score_letters

    end

    def score_word
    end
  end
end
