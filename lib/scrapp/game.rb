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

  attr_accessor :error_code
  attr_accessor :score
  attr_accessor :word

  def initialize(word)
    @word = word
    @error_code = validate_input(@word)
    @score = score_word(@word) if @error_code == 0
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

  def error?
    @error_code > 0
  end

  def valid_chars?(word)
    word.chars.all? { |char| VALID_CHARS.include? char.upcase }
  end

  def valid_char_count?(word)
    word.scan(/\W{3,}/).length.zero?
  end

  def valid_star_pos?(word)
    match = word.scan(/\A\W+/)
    if match.length.zero?
      true
    else
      match.join.scan(/[*]/).length.zero? ? true : false
    end
  end

  def valid_bang_pos?(word)
    match = word.scan(/\b\W+/)
    if match.length.zero?
      true
    else
      match.join.scan(/[!]/).length.zero? ? true : false
    end
  end

  def score_letters(word)
    word.scan(/\w/).map(&:upcase).reduce(0) do |total, current|
      total + LETTER_VALUES[current]
    end
  end

  def score_bonus_letters(word)
    bonus_letters = word.scan(/(\w\b)(\W+)/).map { |letter|
      letter[0].upcase * letter[1].length }.join
    bonus_letters.length.zero? ? 0 : score_letters(bonus_letters)
  end

  def score_word(word)
    word_bonus = word.scan(/\A\W+/).join.length + 1
    # word_bonus = multipliers.zero? ? 1 : multipliers + 1
    (score_letters(word) + score_bonus_letters(word)) * word_bonus 
  end
end
