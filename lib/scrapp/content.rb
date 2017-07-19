module Scrapp

  require 'artii'
  
  TITLE = Artii::Base.new font: 'slant'

  HEADER = [
    [TITLE.asciify('S  C  R  A  P  P')],
    ["\e[1mA SCRABBLE WORD SCORE APP\e[0m\n "]
  ].freeze

  BONUS_BINGO = [
    ["\n\e[1m\e[36mBINGO BONUS\e[0m"], 
    ["\nRespond to the prompt after entering a <word> of 7 characters to"],
    ["claim 50 bouns points for a Bingo.\n "]
  ].freeze

  BONUS_LETTER = [
    ["\n\e[1m\e[34m* LETTER BONUS *\e[0m"],
    ["\nPlace a max. of 2 consecutive letter bonus characters after a <letter>"],
    ["\n\e[34mDOUBLE LETTER\e[0m score => <letter>\e[1m*\e[0m"],
    ["\e[1mho*pe\e[0m = \e[1mhope\e[0m" \
     " word score inc. double letter score \e[1mo\e[0m"],
    ["\n\e[34mTRIPLE LETTER\e[0m score => <letter>\e[1m**\e[0m"],
    ["\e[1mva**st\e[0m = \e[1mvast\e[0m" \
     " word score inc. triple letter score \e[1ma\e[0m"]
  ].freeze

  BONUS_WORD = [
    ["\n\e[1m\e[35m! WORD BONUS !\e[0m"],
    ["\nPlace a maximum of 2 word bonus characters before <word>"],
    ["\n\e[35mDOUBLE WORD\e[0m score => \e[1m!\e[0m<word>"],
    ["\e[1m!hello\e[0m = \e[1mhello\e[0m with double word score"],
    ["\n\e[35mTRIPLE WORD\e[0m score => \e[1m!!\e[0m<word>"],
    ["\e[1m!!fancy\e[0m = \e[1mfancy\e[0m with triple word score"]
  ].freeze

  ERROR_TITLE = "\n\e[1m\e[31mERROR!\e[0m\n".freeze

  ERROR_FOOTER = "\n<press any key to continue>\n ".freeze

  ERROR = [
    [["#{ERROR_TITLE}Only alphabetic and bonus multiplier characters" \
      " permitted#{ERROR_FOOTER}"]],
    [["#{ERROR_TITLE}Only 2 word(!) or letter(*) multipliers can be" \
      " arranged sequentially#{ERROR_FOOTER}"]],
    [["#{ERROR_TITLE}The letter bonus character (*) cannot be placed in" \
      " front of <word>#{ERROR_FOOTER}"]],
    [["#{ERROR_TITLE}The word bonus character (!) can only be placed in" \
      " front of <word>#{ERROR_FOOTER}"]]
  ].freeze

  BYE = Artii::Base.new font: 'smslant'

  FAREWELL = [
    [BYE.asciify('Goodbye')]
  ].freeze

  INTRO = [
    ["\nEnter a word to calculate its Scrabble score\n "]
  ].freeze
  
  PROMPT = [
    ["\n" + ' ' * 19 + "\e[1mYour word:\e[0m"],
    [' ' * 18 + "\e[1mWord score:\e[0m\n "]
  ].freeze

  SCORE_AGAIN = [
    ["\n\e[1mScore another word?\e[0m"],
    ["\n\e[1m\e[32mY\e[0mes | \e[1m\e[31mN\e[0mo\n "]  
  ].freeze

  TRIVIA_TITLE = [
    "\e[1mSCRABBLE TRIVIA\e[0m\n\n",
    "\e[1mFUN FACT\e[0m\n\n",
    "\e[1mCRAZY BUT TRUE\e[0m\n\n",
    "\e[1mDID YOU KNOW?\e[0m\n\n",
    "\e[1mOMG!\e[0m\n\n",
    "\e[1mRANDOM FACT\e[0m\n\n"
  ].freeze.sample
  
  TRIVIA = [
    [["\n#{TRIVIA_TITLE}Scrabble was invented in 1938 by " \
      "American architect, Alfred Butts.\n "]],
    [["\n#{TRIVIA_TITLE}Scrabble's original name was " \
      "Criss-Crosswords.\n "]]
  ].freeze.sample
end
