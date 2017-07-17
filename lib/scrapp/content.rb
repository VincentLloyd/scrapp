module Scrapp

  require 'artii'
  
  TITLE = Artii::Base.new font: 'slant'

  HEADER = [
    [TITLE.asciify('SCRAPP')],
    ["\e[1mA SCRABBLE WORD SCORE APP\e[0m\n "]
  ].freeze

  BONUS_GUIDE = [
    ["\n\e[1m\e[33mLETTER BONUS\e[0m"],
    ["\n\e[33mDOUBLE LETTER\e[0m score => <letter>\e[1m*\e[0m"],
    ["\e[1mho*pe\e[0m = \e[1mhope\e[0m" \
     " word score inc. double letter score \e[1mo\e[0m"],
    ["\n\e[33mTRIPLE LETTER\e[0m score => <letter>\e[1m**\e[0m"],
    ["\e[1mva**st\e[0m = \e[1mvast\e[0m" \
     " word score inc. triple letter score \e[1ma\e[0m"],
    ["\n\e[1m\e[34mWORD BONUS\e[0m"],
    ["\n\e[34mDOUBLE WORD\e[0m score => \e[1m!\e[0m<word>"],
    ["\e[1m!hello\e[0m = \e[1mhello\e[0m with double word score"],
    ["\n\e[34mTRIPLE WORD\e[0m score => \e[1m!!\e[0m<word>"],
    ["\e[1m!!fancy\e[0m = \e[1mfancy\e[0m with triple word score\n "]
  ].freeze

  ERROR = [
    [["Invalid characters entered"]],
    [["Too many sequential special characters entered"]],
    [["\'*\'s must not be placed in front of a word"]],
    [["\'!\'s can only be placed in front of a word"]]
  ].freeze

  INTRO = [
    ["\nEnter a word at the prompt to calculate its Scrabble score\n "]
  ].freeze
  
  PROMPT = [
    ["\n" + ' ' * 9 + "\e[1mYour word:\e[0m"],
    [' ' * 8 + "\e[1mWord score:\e[0m\n "]
  ].freeze

  SCORE_AGAIN = [
    ["\n\e[1mScore another word?\e[0m"],
    ["\n\e[1mY\e[0mes / \e[1mN\e[0mo:  \n "]  
  ].freeze

  TRIVIA_TITLE = [
    "\e[1mSCRABBLE TRIVIA\e[0m\n\n",
    "\e[1mFUN FACT\e[0m\n\n",
    "\e[1mCRAZY BUT TRUE\e[0m\n\n",
    "\e[1mDID YOU KNOW?\e[0m\n\n",
    "\e[1mOMG!\e[0m\n\n",
    "\e[1mRANDOM FACT\e[0m\n\n"
  ].sample
  
  TRIVIA = [
    [["\n#{TRIVIA_TITLE}Scrabble was invented in 1938 by " \
      "American architect, Alfred Butts.\n "]],
    [["\n#{TRIVIA_TITLE}Scrabble's original name was " \
      "Criss-Crosswords.\n "]]
  ].freeze
end
