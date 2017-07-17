module Scrapp
  class Game
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
    attr_accessor :error_code

    def initialize(word)
      @word = word
      @error_code = validate_input(@word)
    end

    def validate_input(word)
      if !valid_chars?(word)
        @error_code = 1
      elsif !valid_char_count?(word)
        @error_code = 2
      elsif !valid_star_pos?(word)
        @error_code = 3
      elsif !valid_bang_pos?(word)
        @error_code = 4
      else
        @error_code = 0
      end
    end

    def valid_chars?(word)
      word.chars.all? { |char| VALID_CHARS.include? char.upcase }
    end

    def valid_char_count?(word)
      word.scan(/\W{3,}/).length.zero?
    end

    def valid_star_pos?(word)
      result = word.scan(/\A\W+/)
      if result.length.zero?
        true
      else
        result.join.scan(/[*]/).length.zero? ? true : false
      end
    end

    def valid_bang_pos?(word)
      result = word.scan(/\b\W+/)
      if result.length.zero?
        true
      else
        result.join.scan(/[!]/).length.zero? ? true : false
      end
    end

    def score_letters
    end

    def score_word
    end
  end
end
